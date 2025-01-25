extends Node3D

@export var cameraTargetNode:Node3D
@export var cameraMoveSpeed:float

var targetXPosition: float
var targetYPosition: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	 
	var newXPos = lerpf(global_position.x, cameraTargetNode.global_position.x, cameraMoveSpeed*delta)
	var newYPos = lerpf(global_position.y, cameraTargetNode.global_position.y, cameraMoveSpeed*delta)

	global_position.x = newXPos
	global_position.y = newYPos
	
	#global_position.x = cameraTargetNode.global_position.x
	#global_position.y = cameraTargetNode.global_position.y
