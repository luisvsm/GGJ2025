extends VBoxContainer
@onready var key_pad: CenterContainer = %KeypadContainer
@onready var keypad_1: Button = %Keypad1
@onready var keypad_2: Button = %Keypad2
@onready var keypad_3: Button = %Keypad3
@onready var keypad_4: Button = %Keypad4
@onready var keypad_5: Button = %Keypad5
@onready var keypad_6: Button = %Keypad6
@onready var keypad_7: Button = %Keypad7
@onready var keypad_8: Button = %Keypad8
@onready var keypad_9: Button = %Keypad9
@onready var join_lobby: Button = %JoinLobby
@onready var lobby_input_code: Label = %LobbyInputCode
@onready var keypad_buttons: HBoxContainer = %KeypadButtons
@onready var close_join_menu: Button = %CloseJoinMenu
@onready var reset_keypad: Button = %ResetKeypad
@onready var leave_lobby: Button = %LeaveLobby
@onready var start_game: Button = %StartGame
@onready var lobby_status: Label = %LobbyStatus
@onready var ready_button: Button = %Ready

const lobbyCodeLength:int = 4
var lobbyCode = ""
var playerUserID:String
var playerUserData:LobbyMessage.UserData
var playerLobby:LobbyMessage.LobbyInfo
var playerReady:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameServerStatus.IsGameServer():
		return
		
	ResetLobbyCode()
	ShowMainLobbyMenu()
	
	LobbyClientLogic.ConnectingToLobbyServer.connect(_OnConnectingToLobbyServer)
	LobbyClientLogic.ConnectedToLobbyServer.connect(_OnConnectedToLobbyServer)
	LobbyClientLogic.DisconnectedFromLobbyServer.connect(_OnDisconnectedFromLobbyServer)
	LobbyClientLogic.MessageFromLobbyServer.connect(_OnMessageFromLobbyServer)
	LobbyClientLogic.ConnectToLobbyServer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _OnConnectingToLobbyServer() -> void:
	SetLobbyButtonsActive(false)
	lobby_status.text = "Connecting..."
	
func _OnConnectedToLobbyServer() -> void:
	lobby_status.text = "Connected!"
	
func _OnDisconnectedFromLobbyServer(error:String) -> void:
	lobby_status.text = error
	
func _OnMessageFromLobbyServer(type:LobbyClientLogic.MessageType, message:Dictionary) -> void:
	
	match type:
		LobbyClientLogic.MessageType.UserInfo:
			playerUserID = message["userID"]
			playerUserData = LobbyMessage.UserData.new()
			#TODO: Parse message["userData"] if you want to use it
		LobbyClientLogic.MessageType.LobbyInfo:
			playerLobby = LobbyMessage.LobbyInfo.new()
			playerLobby.lobbyID = message["lobbyID"]
			playerLobby.users = []
			for user in message["users"]:
				var lobbyUser = LobbyMessage.LobbyUser.new()
				lobbyUser.ready = user["ready"]
				lobbyUser.userID = user["userID"]
				lobbyUser.userData = LobbyMessage.UserData.new()
				#TODO: Parse user["userData"] if you want to use it
				playerLobby.users.push_back(lobbyUser)
				
			SetLobbyButtonsActive(true)
			playerReady = false
			ShowMainLobbyMenu()
			
		LobbyClientLogic.MessageType.Ready:
			for updatedUserReady in message["users"]:
				for user in playerLobby.users:
					if user.userID == updatedUserReady["userID"]:
						user.ready = updatedUserReady["ready"]
			UpdateLobbyPlayers()
		LobbyClientLogic.MessageType.ServerStatus:
			lobby_status.text = message["message"]
			if message["failed"] == true:
				SetLobbyButtonsActive(true)
		_: #Default
			print("Unhandled message type: %s\n%s"%[type,message])

func UpdateLobbyPlayers() -> void:
	if playerLobby:
		lobby_input_code.text = playerLobby.lobbyID
		lobby_status.text = ""
		for player in playerLobby.users:
			lobby_status.text += "%s Ready: %s\n"%[player.userID, player.ready]
		

func _on_join_lobby_pressed() -> void:
	ShowKeypad()

func _on_close_join_menu_pressed() -> void:
	ShowMainLobbyMenu()

func _on_reset_keypad_pressed() -> void:
	ResetLobbyCode()
	
func _on_leave_lobby_pressed() -> void:
	LobbyClientLogic.LeaveLobby()
	SetLobbyButtonsActive(false)

func _on_start_game_pressed() -> void:
	LobbyClientLogic.StartGame(1)
	SetLobbyButtonsActive(false)
	
func _on_ready_pressed() -> void:
	playerReady = not playerReady
	UpdatePlayerReady()
	
func _on_append_number(newNumber:String) -> void:
	lobbyCode = lobbyCode + newNumber
	UpdateLobbyCodeLabel()
	if(lobbyCode.length() == lobbyCodeLength):
		lobby_input_code.text = "Joining: %s..."%lobbyCode
		_set_keypad_active(false)
		LobbyClientLogic.JoinLobby(lobbyCode)

func UpdatePlayerReady()->void:
	if playerReady:
		ready_button.text = "Ready"
	else:
		ready_button.text = "Not Ready"
			
	if playerLobby:
		LobbyClientLogic.SetReady(playerReady)

#UI Management code
func ShowMainLobbyMenu() -> void:
	key_pad.hide()
	keypad_buttons.hide()
	ready_button.show()
	SetLobbyButtonsActive(true)
	UpdatePlayerReady()
	if playerLobby:
		lobbyCode = playerLobby.lobbyID
		UpdateLobbyPlayers()
	
func ShowKeypad() -> void:
	key_pad.show()
	keypad_buttons.show()
	ready_button.hide()
	ResetLobbyCode()
	_set_keypad_active(true)

func UpdateLobbyCodeLabel() -> void:
	lobby_input_code.text = lobbyCode

func ResetLobbyCode() -> void:
	lobbyCode = ""
	UpdateLobbyCodeLabel()

func SetLobbyButtonsActive(active:bool) -> void:
	var disabled = active != true
	join_lobby.disabled = disabled
	start_game.disabled = disabled
	leave_lobby.disabled = disabled

func _set_keypad_active(active:bool) -> void:
	var disabled = active != true
	keypad_1.disabled = disabled
	keypad_2.disabled = disabled
	keypad_3.disabled = disabled
	keypad_4.disabled = disabled
	keypad_5.disabled = disabled
	keypad_6.disabled = disabled
	keypad_7.disabled = disabled
	keypad_8.disabled = disabled
	keypad_9.disabled = disabled
	reset_keypad.disabled = disabled
	close_join_menu.disabled = disabled
