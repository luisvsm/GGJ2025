extends Node3D


@export var cameraNode:Node3D
var playerPrefab = load("res://Prefabs//Player.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var newPlayerInstance = playerPrefab.instantiate()
	add_child(newPlayerInstance)
	var cameraLookAt = newPlayerInstance.get_node("Node3D - CameraLookAt")
	cameraNode.cameraTargetNode = cameraLookAt
	print(cameraNode.cameraTargetNode)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
