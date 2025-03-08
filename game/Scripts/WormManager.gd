class_name WormManager
extends Node3D

@export var wormSpawnExtentMin: float
@export var wormSpawnExtentMax: float

var wormPrefab = load("res://Prefabs//Worm.tscn")
var rng = RandomNumberGenerator.new()
var maxWorms = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test_spawn"):
		_spawnWorm()
		
		
	
func _spawnWorm() -> void:
	if get_children().size() >= maxWorms:
		return
		
	AudioManager.PlaySound("worm-spawn")
	var newWormInstance = wormPrefab.instantiate()
	var wormXpos = rng.randf_range(wormSpawnExtentMin, wormSpawnExtentMax)
	add_child(newWormInstance)
	newWormInstance.position.x = wormXpos
