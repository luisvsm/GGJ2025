extends Node

var LobbyServerHTTP = "https://luis.ggj25.helios.connectedplay.io/server/account/guest"
var LobbyServerIP = IP.resolve_hostname("luis.ggj25.helios.connectedplay.io")
var LobbyServerPort = 27046
var maxRetryDelay = 10

signal ConnectingToLobbyServer()
signal ConnectedToLobbyServer()
signal DisconnectedFromLobbyServer(error:String)
signal MessageFromLobbyServer(type:MessageType, message:Dictionary)


@onready var rng = RandomNumberGenerator.new()

var connection: StreamPeerTCP
var connected = false
var messageLength:int
var messageType:int
var messageJSON:String
var retryCout = 0
var sessionToken:String

enum MessageType{
	UserInfo        = 1,  # UserInfoMessasge
	LobbyInfo       = 2,  # LobbyInfoMessasge
	JoinLobby       = 3,  # (sends back a LobbyInfo)
	LeaveLobby      = 4,  # (sends back a LobbyInfo)
	KickPlayer      = 5,  # (sends back a LobbyInfo)
	UpdateUser      = 6,  # (1. submitting person get's a UserInfoMessasge)(2. everyone including you get's a LobbyInfo)
	StartGame       = 7,  # Sent by the game client when it's ready (automatically or maybe when the player clicks start etc)
	Ready           = 8,  # (1. submitting person get's a UserInfoMessasge)(2. everyone including you get's a LobbyInfo)
	Chat            = 9,  # Sends back MessasgeChat to everyone
	GameSettings    = 10, # 
	ServerStatus    = 11, # Eg finding server, looking for players to match with, etc
	ServerInfo      = 12, # Eg where should the players join
	StartSession    = 13, # When the game client connects to the lobby server with a valid token
	FindActiveGame  = 14
}

func _ready():
	set_process(false)
	
func ConnectToLobbyServer() -> void:
	if connection != null:
		print("Already trying to connect to server")
		return
	print("Connecting to lobby server")
	ConnectingToLobbyServer.emit()
	connection = StreamPeerTCP.new()
	connected = false
	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._OnGetTokenResponse)

	# Perform a GET request. The URL below returns JSON as of writing.
	var error = http_request.request(LobbyServerHTTP)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

func _OnGetTokenResponse(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	if response_code != 200:
		push_error("An error occurred requesting a session token\nError %s:\n%s"%[response_code,body.get_string_from_utf8()])
		_OnDisconnected()
		return
		
	sessionToken = body.get_string_from_utf8()
	connection.connect_to_host(LobbyServerIP, LobbyServerPort)
	set_process(true)

func _OnDisconnected() -> void:
	print("Disconnected from Lobby Server")
	DisconnectedFromLobbyServer.emit("Lost connection to lobby server")
	connection = null
	connected = false
	set_process(false)
	retryCout += 1
	print("Waiting %s seconds before reconnecting..."%min(maxRetryDelay, retryCout*2))
	await get_tree().create_timer(min(maxRetryDelay, retryCout*2)).timeout
	print("Retrying now!")
	ConnectToLobbyServer()
	
func _OnConnected() -> void:
	print("Connected to Lobby Server")
	connected = true
	connection.put_data(
		(sessionToken+"~").to_ascii_buffer()
	)

func _process( delta ):	
	if connection == null:
		return
		
	connection.poll()

	if !connected:
		if connection.get_status() == connection.STATUS_CONNECTED:
			_OnConnected()
		elif connection.get_status() == StreamPeerTCP.STATUS_CONNECTING:
			print("Trying to connect to " + LobbyServerIP + " : " + str(LobbyServerPort))
		elif connection.get_status() == connection.STATUS_NONE or connection.get_status() == StreamPeerTCP.STATUS_ERROR:
			print("Error connecting to " + LobbyServerIP + " : " + str(LobbyServerPort))
		return
	
	if connection.get_status() == connection.STATUS_NONE or connection.get_status() == connection.STATUS_ERROR:
		print("Lost connection to lobby server for some reason")
		_OnDisconnected()
		return
	
	var available_bytes: int = connection.get_available_bytes()
	if available_bytes > 0:
		messageLength = connection.get_u16()
		messageType = connection.get_u16()
		if messageLength <= available_bytes - 4:
			# print("Got data:\nmessageLength[%s]\nmessageType[%s]\nmessageJSON: %s"%[messageLength, messageType, messageJSON])
			messageJSON = connection.get_string(messageLength)
			
			if messageType == MessageType.StartSession:
				ConnectedToLobbyServer.emit()
				SendMessageToLobby({
					type = MessageType.StartSession,
					clientVersion = "latest",
					userData = {}
				})
			else:
				MessageFromLobbyServer.emit(messageType, JSON.parse_string(messageJSON))
		else:
			push_error("Got malformed data:\nmessageLength[%s]\nmessageType[%s]\n%s bytes of json expected %s"%[messageLength, messageType,available_bytes - 4, messageLength])
			connection.disconnect_from_host()

func SendMessageToLobby(request:Dictionary) -> void:
	if request.has("type"):
		var jsonString = JSON.stringify(request)
		print("Sending message to Lobby Server:\n%s"%jsonString)
		connection.put_data(
			jsonString.to_ascii_buffer()
		)

func JoinLobby(code:String) -> void:
	SendMessageToLobby({
		type = MessageType.JoinLobby,
		lobbyID = code
	})
	
func LeaveLobby() -> void:
	SendMessageToLobby({
		type = MessageType.LeaveLobby
	})
	
func KickPlayer(userID:String) -> void:
	SendMessageToLobby({
		userID = userID,
		type = MessageType.KickPlayer
	})
	
func UpdatePlayerData(userData:LobbyMessage.UserData) -> void:
	SendMessageToLobby({
		userData = {
			userData = userData.name,
			colour = userData.colour
		},
		type = MessageType.UpdateUser
	})
	
func StartGame(gameMode:int) -> void:
	SendMessageToLobby({
		gameMode = gameMode,
		type = MessageType.StartGame
	})

func SetReady(ready:bool) -> void:
	SendMessageToLobby({
		ready = ready,
		type = MessageType.Ready
	})
	
func SendChat(chatData:String) -> void:
	SendMessageToLobby({
		chatData = chatData,
		type = MessageType.Chat
	})

func SendGameSettings(gameSettings:Dictionary) -> void:
	SendMessageToLobby({
		gameSettings = gameSettings,
		type = MessageType.GameSettings
	})
