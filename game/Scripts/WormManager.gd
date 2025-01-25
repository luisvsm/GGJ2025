extends Node3D

@export var wormSpawnExtentMin: float
@export var wormSpawnExtentMax: float

var scene = load("res://Scenes//Worm.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test_spawn"):
		var nweWormInstance = scene.instantiate()
		var wormXpos = rng.randf_range(wormSpawnExtentMin, wormSpawnExtentMax)
		add_child(nweWormInstance)
		nweWormInstance.position.x = wormXpos
		
		
	
