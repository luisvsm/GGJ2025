extends RigidBody3D
#@onready var mesh_instance_3d___body: MeshInstance3D = $"MeshInstance3D - Body"
@onready var node_3d___body: Node3D = $"Node3D - Body"
@onready var node_3d___tail: Node3D = $"Node3D - Body/Node3D - Tail"

@export var moveForce: float
@export var jumpForce:float
@export var jumpCoolDown:float
@export var tailFlapCoolDown:float
@export var tailFlapAngleUp:float
@export var tailFlapAngleDown:float


var jumpCoolDownTimer:float = 0
var jumped: bool = false
var leftFacing = true
var TailFlapCoolDownTimer:float = 0
var tailFlapping = false

var leftStickHAxis: float
var deltaMoveVector: Vector3 = Vector3(0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	continuous_cd = true
	node_3d___tail.rotation.z = tailFlapAngleDown
	#gravity_scale = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	leftStickHAxis = Input.get_axis("move_left", "move_right")
	var deltaMove = delta*leftStickHAxis*moveForce
	var deltaMoveVector = Vector3(deltaMove, 0, 0)
	if abs(deltaMove) > 0:
		apply_central_force(deltaMoveVector)
	
	if deltaMove > 0:
		leftFacing = false
	if deltaMove < 0:
		leftFacing = true

	if leftFacing == true:
		node_3d___body.rotation.y = rad_to_deg(180)
	if leftFacing == false:
		node_3d___body.rotation.y = 0

		
	if Input.get_action_strength("jump") > 0:
		if jumped == false:
			apply_central_force(Vector3(0, jumpForce, 0))
			jumped = true
			tailFlapping = true

	if jumped == true:
		jumpCoolDownTimer += delta
	if jumpCoolDownTimer >= jumpCoolDown:
		jumped = false
		jumpCoolDownTimer = 0
		
	if tailFlapping == true:
		TailFlapCoolDownTimer += delta
	if TailFlapCoolDownTimer >= tailFlapCoolDown:
		tailFlapping = false
		TailFlapCoolDownTimer = 0

		
	if tailFlapping == true:
		node_3d___tail.rotation.z = rad_to_deg(tailFlapAngleUp)
	if tailFlapping == false:
		node_3d___tail.rotation.z = rad_to_deg(tailFlapAngleDown)
		
	
	print (leftFacing)
	#print (mesh_instance_3d___body.rotation.y)
	
