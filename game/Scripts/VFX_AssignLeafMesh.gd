extends GPUParticles3D

@export var mesh1:Mesh 
@export var mesh2:Mesh 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UpdateMeshVariables()
	await get_tree().create_timer(4.0).timeout
	queue_free()

func SetMeshes(mesh1Input:Mesh, mesh2Input:Mesh) -> void:
	mesh1 = mesh1Input
	mesh2 = mesh2Input
	UpdateMeshVariables()

func UpdateMeshVariables():
	draw_pass_1 = mesh1
	draw_pass_2 = mesh2
	print(mesh1)
	print(mesh2)
