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
@onready var new_lobby: Button = %NewLobby
@onready var join_lobby: Button = %JoinLobby
@onready var lobby_input_code: Label = %LobbyInputCode
@onready var keypad_buttons: HBoxContainer = %KeypadButtons
@onready var close_join_menu: Button = %CloseJoinMenu
@onready var reset_keypad: Button = %ResetKeypad
@onready var leave_lobby: Button = %LeaveLobby
@onready var start_game: Button = %StartGame

const lobby_code_length:int = 3
var lobby_code = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_resetLobbyCode()
	LobbyServerLogic.join_failed.connect(_on_join_failed)
	LobbyServerLogic.join_success.connect(_on_join_success)
	LobbyServerLogic.leave_lobby.connect(_on_leave_lobby)
	LobbyServerLogic.start_failed.connect(_on_start_failed)
	LobbyServerLogic.start_success.connect(_on_start_success)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Lobby UI button signals
func _on_new_lobby_pressed() -> void:
	_set_main_lobby_buttons_active(false)
	lobby_input_code.show()
	lobby_input_code.text = "Creating Lobby!"
	LobbyServerLogic.CreateLobby()

func _on_join_lobby_pressed() -> void:
	_show_keypad()

func _on_close_join_menu_pressed() -> void:
	_show_main_lobby_menu()

func _on_reset_keypad_pressed() -> void:
	_resetLobbyCode()
	
func _on_leave_lobby_pressed() -> void:
	LobbyServerLogic.LeaveLobby()
	start_game.disabled = true
	leave_lobby.disabled = true

func _on_start_game_pressed() -> void:
	LobbyServerLogic.StartGame()
	lobby_input_code.text = ""
	start_game.disabled = true
	leave_lobby.disabled = true

func _append_number(newNumber:String) -> void:
	lobby_code = lobby_code + newNumber
	_update_lobby_code_label()
	if(lobby_code.length() == lobby_code_length):
		lobby_input_code.text = "Joining: %s..."%lobby_code
		_set_keypad_active(false)
		LobbyServerLogic.JoinLobby(lobby_code)

#Lobby server signals
func _on_join_failed(error:String) -> void:
	_resetLobbyCode()
	_set_keypad_active(true)
	lobby_input_code.text = "Failed to join: %s"%error
	
func _on_start_failed(error:String) -> void:
	lobby_input_code.text = "Failed to start: %s"%error
	start_game.disabled = false
	leave_lobby.disabled = false
	
func _on_start_success() -> void:
	lobby_input_code.text = "Joining game server!"
	start_game.disabled = false
	leave_lobby.disabled = false
	
func _on_join_success(lobby_code:String) -> void:
	_hide_all()
	lobby_input_code.show()
	lobby_input_code.text = "Joined Lobby: %s"%lobby_code
	start_game.show()
	leave_lobby.show()
	start_game.disabled = false
	leave_lobby.disabled = false

func _on_leave_lobby() -> void:
	_show_main_lobby_menu()

#UI Management code
func _show_main_lobby_menu() -> void:
	_hide_all()
	new_lobby.show()
	join_lobby.show()
	_set_main_lobby_buttons_active(true)
	
func _hide_all() -> void:
	key_pad.hide()
	keypad_buttons.hide()
	new_lobby.hide()
	join_lobby.hide()
	lobby_input_code.hide()
	start_game.hide()
	leave_lobby.hide()
	
func _show_keypad() -> void:
	_hide_all()
	key_pad.show()
	keypad_buttons.show()
	lobby_input_code.show()
	_resetLobbyCode()
	_set_keypad_active(true)

func _update_lobby_code_label() -> void:
	lobby_input_code.text = lobby_code

func _resetLobbyCode() -> void:
	lobby_code = ""
	_update_lobby_code_label()

func _set_main_lobby_buttons_active(active:bool) -> void:
	var disabled = active != true
	join_lobby.disabled = disabled
	new_lobby.disabled = disabled

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
