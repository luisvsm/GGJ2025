extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scene = load("res://Scenes//Worm.tscn")
	var instance = scene.instantiate()
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
