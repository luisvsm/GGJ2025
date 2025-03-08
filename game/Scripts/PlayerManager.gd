extends Node3D

@export var cameraNode:Node3D
@export var wormManager:Node3D

var playerPrefab = load("res://Prefabs//Player.tscn")
# var sceneryPrefab = load("res://Prefabs//scene_decorations.tscn")
var treePrefab = load("res://Prefabs//Tree.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var newPlayerInstance:Player = playerPrefab.instantiate()
	add_child(newPlayerInstance)
	#var newSceneDecorationsInstance = sceneryPrefab.instantiate()
	#add_child(newSceneDecorationsInstance)
	var newTreeInstance:gameTree = treePrefab.instantiate()
	add_child(newTreeInstance)

	var cameraLookAt = newPlayerInstance.get_node("Node3D - CameraLookAt")
	cameraNode.cameraTargetNode = cameraLookAt
	#print(cameraNode.cameraTargetNode)
	var tempNode = newPlayerInstance.get_node("Node3D - CameraLookAt").get_parent()
	tempNode.wormManager = wormManager
	newPlayerInstance.treeInstance = newTreeInstance
	
	#newTreeInstance.leafPlatforms[]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
