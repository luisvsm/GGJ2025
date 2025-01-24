extends RigidBody3D

@export var moveSpeed: float
#@export var stopThreshold:float
@export var jumpForce:float
var leftStickHAxis: float
var deltaMoveVector: Vector3 = Vector3(0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	continuous_cd = true
	#gravity_scale = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	leftStickHAxis = Input.get_axis("move_left", "move_right")
	var deltaMove = delta*leftStickHAxis*moveSpeed
	var deltaMoveVector = Vector3(deltaMove, 0, 0)
	#linear_velocity += Vector3(1, 0, 0)
	if abs(deltaMove) > 0:
		#linear_velocity += deltaMoveVector
		apply_central_force(deltaMoveVector)
		
	if Input.get_action_strength("jump") > 0:
		apply_central_force(Vector3(0, jumpForce, 0))
		
	
	#if leftStickHAxis < stopThreshold:
		#linear_velocity = Vector3(0, 0, 0)
		#sleeping = true
	#position += deltaMoveVector
	print (deltaMove)
	#print("hi")
