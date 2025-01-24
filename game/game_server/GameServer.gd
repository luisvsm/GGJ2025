# Most of this script is from
# https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html
extends Node2D

const particlePrefab = preload("res://example/fun_lil_worm_particle.tscn")

# These signals can be connected to by a UI lobby scene or the game scene.
signal player_connected(peer_id, player_info)
signal player_disconnected(peer_id)
signal server_disconnected

const PORT = 27050
const DEFAULT_SERVER_IP = "127.0.0.1" # IPv4 localhost
const MAX_CONNECTIONS = 20

# This will contain player info for every player,
# with the keys being each player's unique IDs.
var players = {}

# This is the local player info. This should be modified locally
# before the connection is made. It will be passed to every other peer.
# For example, the value of "name" can be set to something the player
# entered in a UI scene.
var player_info = {"name": "Name"}

var players_loaded = 0

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if event.pressed:
			make_particle.rpc(
				get_viewport().canvas_transform.affine_inverse()*event.position
			)

@rpc("any_peer", "call_local", "reliable")
func make_particle(position:Vector2):
	print("Todo make particle: %s,%s"%[position.x,position.y])
	var instance = particlePrefab.instantiate()
	add_child(instance)
	instance.position = position
	instance.emitting = true
	await get_tree().create_timer(4.0).timeout
	remove_child(instance)
	
func _ready():
	multiplayer.peer_connected.connect(_on_player_connected)
	multiplayer.peer_disconnected.connect(_on_player_disconnected)
	multiplayer.connected_to_server.connect(_on_connected_ok)
	multiplayer.connection_failed.connect(_on_connected_fail)
	if GameServerStatus.IsGameServer():
		create_game()
		GameServerStatus.Start()
	else:
		join_game(IP.resolve_hostname("luis.ggj25.helios.connectedplay.io"))

func join_game(address = ""):
	print("join_game")
	if address.is_empty():
		address = DEFAULT_SERVER_IP
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(address, PORT)
	if error:
		return error
	multiplayer.multiplayer_peer = peer


func create_game():
	print("create_game")
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(PORT, MAX_CONNECTIONS)
	if error:
		return error
	multiplayer.multiplayer_peer = peer

	players[1] = player_info
	player_connected.emit(1, player_info)


func remove_multiplayer_peer():
	multiplayer.multiplayer_peer = null


# When the server decides to start the game from a UI scene,
# do Lobby.load_game.rpc(filepath)
@rpc("call_local", "reliable")
func load_game(game_scene_path):
	print("load_game")
	get_tree().change_scene_to_file(game_scene_path)


# When a peer connects, send them my player info.
# This allows transfer of all desired data for each player, not only the unique ID.
func _on_player_connected(id):
	print("_on_player_connected")
	_register_player.rpc_id(id, player_info)
	GameServerStatus.PlayerConnected()


@rpc("any_peer", "reliable")
func _register_player(new_player_info):
	print("_register_player")
	var new_player_id = multiplayer.get_remote_sender_id()
	players[new_player_id] = new_player_info
	player_connected.emit(new_player_id, new_player_info)


func _on_player_disconnected(id):
	print("_on_player_disconnected")
	players.erase(id)
	player_disconnected.emit(id)
	GameServerStatus.PlayerDisconnected()


func _on_connected_ok():
	print("_on_connected_ok")
	var peer_id = multiplayer.get_unique_id()
	players[peer_id] = player_info
	player_connected.emit(peer_id, player_info)


func _on_connected_fail():
	print("_on_connected_fail")
	multiplayer.multiplayer_peer = null


func _on_server_disconnected():
	print("_on_server_disconnected")
	multiplayer.multiplayer_peer = null
	players.clear()
	server_disconnected.emit()
