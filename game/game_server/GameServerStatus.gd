extends Node

var serverStartTime:float = Time.get_unix_time_from_system()
var gameHasStarted:bool = false
var playersConnected:int = 0
var requestedTermination:bool = false

# The NodeJS lobby uses this web server to request info about how many
# players are connected, so that empty servers can be terminated
func Start() -> void:
	if IsGameServer() == false:
		return
		
	var server = HttpServer.new()
	server.register_router("/info", InfoRoute.new())
	server.register_router("/mode/1", ModeRoute.new())
	server.register_router("/mode/2", ModeRoute.new())
	server.register_router("/mode/3", ModeRoute.new())
	server.register_router("/mode/4", ModeRoute.new())
	server.register_router("/mode/5", ModeRoute.new())
	
	add_child(server)
	server.start()
	print("GameServerStatus Started")

# Server will be terminated when the following is true
# > gameHasStarted is true, and playersConnected is 0 (eg the game was started, and now all the game clients have disconnected)
# > gameHasStarted is false and uptime is > 30 seconds (eg no game clients connected)
# > requestedTermination is true (the game server has requested that it be terminated for some reason)
# > if the web server request fails 3 times in a row
func GetServerStatus() -> String:
	return "{gameHasStarted:%s,uptime:%s,playersConnected:%s,requestedTermination:%s}"%[
		gameHasStarted,
		Time.get_unix_time_from_system() - serverStartTime,
		playersConnected,
		requestedTermination
	]

# This will mark the game server for deletion, should take about 10 seconds
func RequestTermination() -> void:
	requestedTermination = true
	print("GameServerStatus Requested Termination")

func PlayerConnected() -> void:
	gameHasStarted = true
	playersConnected+=1

func PlayerDisconnected() -> void:
	playersConnected-=1

func IsGameServer() -> bool:
	var args = Array(OS.get_cmdline_args())
	if args.size() > 1 and args[1] == "server":
		return true
	else:
		return false

# Number of players who were in the lobby, and were given the IP & Port of this server
func NumberOfPlayersExpected() -> int:
	var args = Array(OS.get_cmdline_args())
	if args.size() > 2:
		return int(args[2])
	else:
		return 0

func ValidateSessionToken(sessionToken:String) -> bool:
	var args = Array(OS.get_cmdline_args())
	return args.size() > 3 && sessionToken == args[3]
