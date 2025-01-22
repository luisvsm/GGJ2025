extends Node
signal join_failed(error:String)
signal join_success(code:String)
signal start_failed(error:String)
signal start_success()
signal leave_lobby()

@onready var rng = RandomNumberGenerator.new()

func CreateLobby() -> void:
	print("Todo: Create Lobby")
	await get_tree().create_timer(1.0).timeout
	join_success.emit("%s"%rng.randi_range(111,999))
	
func JoinLobby(code:String) -> void:
	print("Todo: Join Lobby '%s'"%code)
	await get_tree().create_timer(1.0).timeout
	if rng.randi_range(0,1) == 1:
		join_failed.emit("testing")
	else:
		join_success.emit("%s"%code)
	
func LeaveLobby() -> void:
	print("Todo: Leave Lobby")
	await get_tree().create_timer(1.0).timeout
	leave_lobby.emit()
	
func StartGame() -> void:
	print("Todo: Look for server!")
	await get_tree().create_timer(1.0).timeout
	if rng.randi_range(0,1) == 1:
		start_failed.emit("testing")
	else:
		start_success.emit()
