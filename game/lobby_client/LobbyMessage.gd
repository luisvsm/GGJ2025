class_name LobbyMessage

extends Node


class GameSettings:
	var foo:String
	
class UserData:
	var foo:String

class LobbyUser:
	var userID:String
	var userData:UserData
	var ready:bool
	
class LobbyUserReadyInfo:
	var userID:String
	var ready:bool

class LobbyInfo:
	var lobbyID:String
	var users:Array[LobbyUser]
	
class ReadyReadyInfo:
	var lobbyID:String
	var users:Array[LobbyUserReadyInfo]

class UpdatedUserData:
	var userID:String
	var userData:UserData
	
class ChatMessage:
	var userID:String
	var chatMessage:String
	
class ServerStatus:
	var message:String
	var failed:bool
	
class ServerPort:
	var port:int
