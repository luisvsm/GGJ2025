class_name Branch extends Node3D

@onready var branch_end: Node3D = $MeshInstance3D/BranchEnd
@onready var attachment_points: Node3D = $AttachmentPoints

func GetEndOfBranchPosition() -> Vector3:
	return branch_end.global_position

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	rotation_degrees = Vector3(0,0, rng.randf_range(-80, 80))
