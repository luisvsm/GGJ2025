
import net from "node:net";
import { ExpressManager } from "./express";
import { TokenManager } from './token';
import { Discord } from './discord';
import { KubeTime, GameServerPodInfo } from './kubetime';

let tokenManager = new TokenManager();
let kubeTime = new KubeTime();
let discord = new Discord();


interface Lobby{
	id: string
	users: LobbyUser[]
	gameIsStarting: boolean
}

interface LobbyUser {
	validated: boolean
	userID: string
	userData: {[id: string]: string | number | boolean}
	socket: net.Socket
	lobby: Lobby
	ready: boolean
	clientVersion: string
}

interface userRequest{
	type: MessageType
	lobbyID?: string
	userID?: string
	userData?: {[id: string]: string | number | boolean}
	ready?:boolean
	chatData?:string
	clientVersion?:string
	gameMode?:number
}


enum MessageType{
    UserInfo        = 1,  // UserInfoMessasge
    LobbyInfo       = 2,  // LobbyInfoMessasge
    JoinLobby       = 3,  // (send back a LobbyInfo)
    LeaveLobby      = 4,  // (send back a LobbyInfo)
    KickPlayer      = 5,  // (send back a LobbyInfo)
    UpdateUser      = 6,  // (1. submitting person get's a UserInfoMessasge)(2. everyone including you get's a LobbyInfo)
    StartGame       = 7,  // Sent by the game client when it's ready (automatically or maybe when the player clicks start etc)
    Ready           = 8,  // (1. submitting person get's a UserInfoMessasge)(2. everyone including you get's a LobbyInfo)
    Chat            = 9,  // Sends back MessasgeChat to everyone
    GameSettings    = 10, // 
    ServerStatus    = 11, // Eg finding server, looking for players to match with, etc
    ServerInfo      = 12, // Eg where should the players join
	StartSession    = 13,
	FindActiveGame  = 14
}


let LobbyList: {[id: string] :Lobby} = {

}

function SendMessage(user:LobbyUser, messageType:MessageType, data:any){
	if(user.socket.writable == false)
		return;
	let jsonMsg = JSON.stringify(data)
	let messageBuffer = Buffer.alloc(Buffer.byteLength(jsonMsg, 'utf8') + 4)

	console.log("Sending '%s'\nmessage length %s of type %s",jsonMsg, messageBuffer.length-4, messageType);
	messageBuffer.writeUInt16LE(messageBuffer.length-4, 0);
	messageBuffer.writeUInt16LE(messageType, 2);
	messageBuffer.write(jsonMsg, 4, 'utf8');
	
	user.socket.write(messageBuffer);
}
function RandomFromOneToNine() : string{
	return Math.ceil(Math.random() * 9).toString();
}

function GetRandomLobbyNumber(): string{
	return RandomFromOneToNine() + RandomFromOneToNine() + RandomFromOneToNine() + RandomFromOneToNine();
}

function JoinEmptyLobby(user:LobbyUser){
	console.log("JoinEmptyLobby")
	let randomLobbyID = GetRandomLobbyNumber();

	for (let index = 0; index < 1000; index++) {
		if(LobbyList[randomLobbyID] != undefined){
			// Suuuurely 1000 tries would do it :P
			randomLobbyID = GetRandomLobbyNumber();
		}else{
			index = 99999;
		}
	}

	JoinLobby(randomLobbyID, user);
}

function LobbyToSerialisable(lobby:Lobby){
	let lobbyToSend: {[id: string]:any} = {
		lobbyID:lobby.id,
		users:[]
	}

	for (let i = 0; i < lobby.users.length; i++) {
		lobbyToSend.users.push(
			{
				userID: lobby.users[i].userID,
				userData: lobby.users[i].userData,
				ready:  lobby.users[i].ready
			}
		);
	}

	return lobbyToSend;
}

function LobbyReadyToSerialisable(lobby:Lobby){
	let lobbyToSend: {[id: string]:any} = {
		lobbyID:lobby.id,
		users:[]
	}

	for (let i = 0; i < lobby.users.length; i++) {
		lobbyToSend.users.push(
			{
				userID: lobby.users[i].userID,
				ready:  lobby.users[i].ready
			}
		);
	}

	return lobbyToSend;
}

function SendStartSession(user: LobbyUser){
	SendMessage(user, MessageType.StartSession, {});
}

function SendUserInfo(user: LobbyUser){
	SendMessage(user, MessageType.UserInfo, {
		userID:user.userID,
		userData:user.userData
	});
}

function SendLobbyInfo(lobby: Lobby){
	let lobbySerialisable = LobbyToSerialisable(lobby);
	for (let i = 0; i < lobby.users.length; i++) {
		SendMessage(lobby.users[i], MessageType.LobbyInfo, lobbySerialisable);
	}
}

function SendLobbyReady(lobby: Lobby){
	let lobbySerialisable = LobbyReadyToSerialisable(lobby);
	for (let i = 0; i < lobby.users.length; i++) {
		SendMessage(lobby.users[i], MessageType.Ready, lobbySerialisable);
	}
}

function SendChat(user: LobbyUser, chatData: string){
	for (let i = 0; i < user.lobby.users.length; i++) {
		SendMessage(user.lobby.users[i], MessageType.Chat, {
			userID: user.userID,
			chatMessage: chatData
		});
	}
}

function SendServerStatus(user: LobbyUser, failed: boolean, message:string){
	for (let i = 0; i < user.lobby.users.length; i++) {
		SendMessage(user.lobby.users[i], MessageType.ServerStatus, {
			message: message,
			failed: failed
		});
	}
}

function SendStartGame(user: LobbyUser, port: Number){
	let message:string = "";

	for (let i = 0; i < user.lobby.users.length; i++) {
		message += "["+user.lobby.users[i].userID+"] joining game server: " + port + "\n";
		SendMessage(user.lobby.users[i], MessageType.StartGame, {
			port: port
		});
	}

	discord.Post(message);
}

// Make the kicked player join an empty lobby
function KickPlayer(userToKick: string, user:LobbyUser){
	// Check if the user is the lobby owner (position 0)
	if(user.lobby.users[0] != user){
		return;
	}

	// Check if the player who we're kicking is in the lobby
	for (let i = 0; i < user.lobby.users.length; i++) {
		const userToCkeck = user.lobby.users[i];
		if(userToKick == userToCkeck.userID){
			JoinEmptyLobby(userToCkeck);
			console.log(`Kicked user ${userToKick} from lobby ${user.lobby.id} (${user.lobby.users.length} users in lobby now)`);
			return;
		}
	}
}

function JoinLobby(lobbyIDToJoin: string, user:LobbyUser){
	// Create a lobby if one doesn't exist
	if(LobbyList[lobbyIDToJoin] == undefined){
		LobbyList[lobbyIDToJoin] = {
			id:lobbyIDToJoin,
			users:[],
			gameIsStarting:false
		}
	}

	LeaveLobby(user);

	LobbyList[lobbyIDToJoin].users.push(user);
	user.lobby = LobbyList[lobbyIDToJoin];
	user.ready = false;

	SendLobbyInfo(user.lobby);

	console.log(`User ${user.userID} joined lobby ${lobbyIDToJoin} (${LobbyList[lobbyIDToJoin].users.length} users in lobby now)`);
}

function LeaveLobby(user:LobbyUser){
	if(user.lobby.id == ""){
		// User is not in a lobby
		return;
	}else if(user.lobby.users.length == 1){
		// There's only 1 player in the lobby so 'leaving' won't do anything because
		// we always want the player to be in a lobby, even if it's just by themselves
		delete LobbyList[user.lobby.id];
		console.log(`Deleting lobbyID: ${user.lobby.id}`);
	}else if(user.lobby.users.length > 1){
		for (let i = 0; i < user.lobby.users.length; i++) {
			if(user.lobby.users[i] == user){
				// Remove the user from the lobby
				user.lobby.users.splice(i,1);
			}
		}

		SendLobbyInfo(user.lobby);

		console.log(`User ${user.userID} left lobby ${user.lobby.id} (${user.lobby.users.length} users in lobby now)`);
	}
	
	user.lobby = {
		id:"",
		users:[],
		gameIsStarting:false
	}
	user.ready = false;
}

function CleanupUser(user:LobbyUser | null){
	if(user == null){
		// Nothing to clean up
	} else {
		console.log("Cleaning up user.");

		discord.Post("["+user.userID+"] Player offline");

		LeaveLobby(user);
		user = null
		console.log("LobbyList length: " + Object.keys(LobbyList).length);
	}
}

let expressManager = new ExpressManager();
expressManager.Start();

function HandleAnonymousMessage(socket:net.Socket, data:Buffer): LobbyUser | null{
	let semiPos = data.indexOf("~");

	if(semiPos > 0){
		let jwt = data.toString().substring(0, semiPos);
		let userToken = tokenManager.ReadUserToken(jwt);

		if (userToken.valid && userToken.data){
			socket.setTimeout(0);
			console.log("Valid JWT");
			return {
				validated: true,
				userID: userToken.data.userID,
				socket:socket,
				userData: {},
				lobby:{
					id:"",
					users:[],
					gameIsStarting:false
				},
				ready: false,
				clientVersion: "latest"
			}
		}else{
			socket.end('goodbye');
			console.log("Invalid JWT");
		}
	}else if(data.length > 600){
		socket.end('goodbye');
		console.log("Lengthy request without JWT");
	}

	return null;
}

async function HandleAuthenticatedMessage(socket:net.Socket, data:string, user:LobbyUser){
	console.log("messageData", data);
	let messageData: userRequest;

	try{
		messageData = JSON.parse(data) as userRequest;
	}catch(err){
		
		console.log("Discarding user request with invalid JSON: " + data);
		return;
	}


	if(messageData.lobbyID != null){
		const regex = /[^1-9]/g;
		messageData.lobbyID = ("1111" + messageData.lobbyID).replace(regex, "").slice(-4);
	}

	switch (messageData.type) {
		case MessageType.JoinLobby:
			if(messageData.lobbyID){
				JoinLobby(messageData.lobbyID.toString(), user);
				discord.Post("["+user.userID+"] Player joined lobby: " + messageData.lobbyID);
			}
			break;
		case MessageType.LeaveLobby:
			JoinEmptyLobby(user);
			break;
		case MessageType.KickPlayer:
			if(messageData.userID){
				KickPlayer(messageData.userID.toString(), user);
			}
			break;
		case MessageType.UpdateUser:
			if(messageData.userData){
				user.userData = messageData.userData;
				
				SendUserInfo(user)
				SendLobbyInfo(user.lobby);
			}
			break;
		case MessageType.Ready:
			if(messageData.ready != null){
				user.ready = messageData.ready == true;
				SendLobbyReady(user.lobby);
			}
			break;
		case MessageType.Chat:
			if(messageData.chatData){
				SendChat(user, messageData.chatData);
			}
			break;
		case MessageType.FindActiveGame:
			SendServerStatus(user, false, "Finding server...");
			if(messageData.gameMode == null){
				console.log("FindActiveGame gameMode was null.");
				return;
			}

			let podActiveGame:GameServerPodInfo | null;

			try{
				podActiveGame = await kubeTime.GetPodsRunningGameMode(messageData.gameMode);
			} catch (err) {
				console.error(err);
				SendServerStatus(user, true, "Failed to find game server");
				break;
			}

			try{
				if(podActiveGame == null){
					podActiveGame = await kubeTime.CreatePod(user.clientVersion, messageData.gameMode);
					
					if(podActiveGame == null){
						SendServerStatus(user, true, "Failed to create game server");
						break;
					}else{
						SendServerStatus(user, false, "Waiting for server to be ready...");
						let success = await kubeTime.WaitForPodToBeReady(podActiveGame.name, messageData.gameMode);
						
					}
				}
			} catch (err) {
				console.error(err);
				SendServerStatus(user, true, "Failed to create game server");
				break;
			}


			if(podActiveGame == null){
				SendServerStatus(user, true, "Failed to create game server");
				break;
			}else{
				SendStartGame(user, podActiveGame.port);
			}

			break;
		case MessageType.StartGame:
			if(user.lobby.gameIsStarting == true){
				console.log("Already creating a server!");
				return;
			}
			
			user.lobby.gameIsStarting = true

			SendServerStatus(user, false, "Creating server...");
			let pod:GameServerPodInfo | null;
			if(messageData.gameMode == null){
				console.log("StartGame gameMode was null.");
				return;
			}
			try{
				pod = await kubeTime.CreatePod(user.clientVersion, messageData.gameMode);
			} catch (err) {
				console.error(err);
				SendServerStatus(user, true, "Failed to create game server");
				break;
			}

			if(pod == null){
				SendServerStatus(user, true, "Failed to create game server");
				break;
			}

			SendServerStatus(user, false, "Waiting for server to be ready...");

			let success = await kubeTime.WaitForPodToBeReady(pod.name, messageData.gameMode);

			if(success){
				SendStartGame(user, pod.port);
			}
			break;
			
		case MessageType.StartSession:
			console.log("Got StartSession");
			
			const regex = /\b[0-9a-f]{7}\b/; // Validate short hash
			if(!messageData.clientVersion){
				socket.end('goodbye');
				console.log("missing clientVersion");
				return;
			}

			if(messageData.clientVersion != "latest" && regex.test(messageData.clientVersion) == false){
				socket.end('goodbye');
				console.log("missing clientVersion");
				return;
			}

			user.clientVersion = messageData.clientVersion;


			if(messageData.userData){
				user.userData = messageData.userData;
			}else{
				user.userData = {};
			}

			SendUserInfo(user);
			JoinEmptyLobby(user);

			discord.Post("["+user.userID+"] Player connected to account server\nClient version #" + user.clientVersion+"\nLobby: "+user.lobby.id);
			break;
			
		default:
			break;
	}

	console.log("HandleAuthenticatedMessage", messageData);
}

const server = net.createServer((socket) => {
	let lobbyUser:LobbyUser | null = null;

	socket.setTimeout(10000); // Wait 10 seconds for JWT
	
	socket.on('timeout', () => {
		console.log('socket timeout');
		try{
			socket.destroy();
		}catch(err){
			console.error("destroy error: ", err);
		}
	}); 

	socket.on('data', (data) => {
		console.log("data: " + data.toString());
		if(lobbyUser == null){
			let messageResult = HandleAnonymousMessage(socket, data);
			
			if (messageResult == null){
				console.log("messageResult == null || lobbyUser == null");
				// The user was not validated. The socket has been closed if required.
			}else if (messageResult.validated == true){
				// The user is now validated
				console.log("messageResult.validated == true");
				
				lobbyUser = messageResult;
				console.log("Sending MessageType.UserInfo");
				SendStartSession(lobbyUser);
			}
		}else if (lobbyUser.validated == true){
			try{
				let messages = data.toString().split("~");
				console.log("messages: ", messages);
	
				for (let i = 0; i < messages.length; i++) {
					const message = messages[i];
					if(message != "")
						HandleAuthenticatedMessage(socket, message, lobbyUser);
				}
			}catch(err){
				console.log(err);
			}
		}
	});

	socket.on('close', function() {
		if(lobbyUser != null){
			CleanupUser(lobbyUser);
		}
		console.log('Connection closed');
	});
	
	socket.on('error', function(err) {
		console.error("Socket error: ", err);
	});
}).on('error', (err) => {
	console.error("Net Server error: ", err);
});

let tcpPort = 7776;
console.log(`TCP running at http://localhost:${tcpPort}`);
server.listen(tcpPort, '0.0.0.0');

// kubeTime.ReadPods();

setInterval(
	function(){kubeTime.LookForServersToTerminate()}, 10 * 1000
); 


discord.Post("NodeJS server started");