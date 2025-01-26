class_name Player
extends RigidBody3D
#@onready var mesh_instance_3d___body: MeshInstance3D = $"MeshInstance3D - Body"
@onready var node_3d___body: Node3D = $"Node3D - Body"
@onready var node_3d___tail: Node3D = $"Node3D - Body/Node3D - Tail"
@onready var node_3d___head: Node3D = $"Node3D - Body/Node3D - Head"
#@onready var node_3d___worm_connection: Node3D = $"Node3D - Body/Node3D - Head/Node3D - WormConnection"
#@onready var node_3d___radial_menu_parent: Node3D = $"Node3D - Radial Menu Parent"

@export var moveForce: float
@export var jumpForce:float
@export var jumpCoolDown:float
@export var tailFlapCoolDown:float
@export var tailFlapAngleUp:float
@export var tailFlapAngleDown:float
@export var peckAngleUp:float
@export var peckAngleDown:float
@export var maxInventory:int

@export var nextWormTimerRangeMin: float
@export var nextWormTimerRangeMax: float
var timePassedSinceLastWorm: float
var currentNextWormTimer: float

#@export var wormConnectionPoint:Vector3
@export var testTextLebel: Label3D

@export var playerInventory: Inventory
@export var wormManager: WormManager
#@export var radialMenuPrefab: Node3D
var radialMenuInstance:Node3D
var radialMenuPrefab:PackedScene

var rng = RandomNumberGenerator.new()

var currentWorm: Node

var jumpCoolDownTimer:float = 0
var jumped: bool = false
var leftFacing = true
var TailFlapCoolDownTimer:float = 0
var tailFlapping = false
var pecking = false
var canPeck = false

var leftStickHAxis: float
var deltaMoveVector: Vector3 = Vector3(0, 0, 0)

var radialMenuVisible: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	continuous_cd = true
	radialMenuPrefab = load("res://Prefabs//Radial Menu.tscn")
	
	node_3d___tail.rotation.z = tailFlapAngleDown
	currentNextWormTimer = rng.randf_range(nextWormTimerRangeMin, nextWormTimerRangeMax)
	print(currentNextWormTimer)	
	#node_3d___radial_menu_parent.set_process(false)
	#wormConnectionPoint = node_3d___worm_connection.position
	#print (wormConnectionPoint)
	#gravity_scale = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	timePassedSinceLastWorm += delta
	if timePassedSinceLastWorm >= currentNextWormTimer:
		#print("NEW WORM TIME!!!!!!!!!!!!")
		timePassedSinceLastWorm = 0
		currentNextWormTimer = rng.randf_range(nextWormTimerRangeMin, nextWormTimerRangeMax)
		wormManager._spawnWorm()

#################################################################################
	
	
	leftStickHAxis = Input.get_axis("move_left", "move_right")
	var deltaMove = delta*leftStickHAxis*moveForce
	var deltaMoveVector = Vector3(deltaMove, 0, 0)
	
	if pecking == false:
		if abs(deltaMove) > 0:
			apply_central_force(deltaMoveVector)
		
		if deltaMove > 0:
			leftFacing = false
		if deltaMove < 0:
			leftFacing = true

		if leftFacing == true:
			node_3d___body.rotation_degrees.y = 180
		if leftFacing == false:
			node_3d___body.rotation.y = 0

#################################################################################
		
	if Input.get_action_strength("jump") > 0:
		if jumped == false:
			if pecking == false:
				apply_central_force(Vector3(0, jumpForce, 0))
				jumped = true
				tailFlapping = true

	if Input.get_action_strength("peck") > 0:
		if jumped == false:
			if canPeck == true:
				pecking = true
	else:
		pecking = false
	
	
	
	if Input.is_action_just_pressed("debug_place_word"):
		if (radialMenuInstance != null):
			radialMenuVisible = false
			radialMenuInstance.queue_free()
		else:
			radialMenuVisible = true
			radialMenuInstance = radialMenuPrefab.instantiate()
			add_child(radialMenuInstance)
			fillRadialMenuFromInventory()
	
	if radialMenuVisible == true:
		if Input.is_action_just_pressed("debug_selsect_1"):
			if playerInventory.inventory.size() >= 1:
				testTextLebel.text = playerInventory.inventory[0].text
				print (playerInventory.inventory[0].text)
		if Input.is_action_just_pressed("debug_selsect_2"):
			if playerInventory.inventory.size() >= 2:
				testTextLebel.text = playerInventory.inventory[1].text
				print (playerInventory.inventory[1].text)
		if Input.is_action_just_pressed("debug_selsect_3"):
			if playerInventory.inventory.size() >= 3:
				testTextLebel.text = playerInventory.inventory[2].text
				print (playerInventory.inventory[2].text)
		if Input.is_action_just_pressed("debug_selsect_4"):
			if playerInventory.inventory.size() >= 4:
				testTextLebel.text = playerInventory.inventory[3].text
				print (playerInventory.inventory[3].text)
		if Input.is_action_just_pressed("debug_selsect_5"):
			if playerInventory.inventory.size() >= 5:
				testTextLebel.text = playerInventory.inventory[4].text
				print (playerInventory.inventory[4].text)
		if Input.is_action_just_pressed("debug_selsect_6"):
			if playerInventory.inventory.size() >= 6:
				testTextLebel.text = playerInventory.inventory[5].text
				print (playerInventory.inventory[5].text)
		if Input.is_action_just_pressed("debug_selsect_7"):
			if playerInventory.inventory.size() >= 7:
				testTextLebel.text = playerInventory.inventory[6].text
				print (playerInventory.inventory[6].text)
		if Input.is_action_just_pressed("debug_selsect_8"):
			if playerInventory.inventory.size() >= 8:
				testTextLebel.text = playerInventory.inventory[7].text
				print (playerInventory.inventory[7].text)
		
		
		
		#if playerInventory.inventory.size() > 0:
		#	print(playerInventory.RemoveRandomWord())


#################################################################################

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
		node_3d___tail.rotation_degrees.z = tailFlapAngleUp
	if tailFlapping == false:
		node_3d___tail.rotation_degrees.z = tailFlapAngleDown
		
	if pecking == true:
		node_3d___head.rotation_degrees.z = peckAngleDown
		if Input.is_action_just_pressed("debug_worm_get"):
			#print("WORM GET!!")
			currentWorm.queue_free()
			if playerInventory.inventory.size() < maxInventory:
				#playerInventory.AddWord()
				print(playerInventory.AddWord())
			pecking = false
			canPeck = false
			


	if pecking == false:
		node_3d___head.rotation_degrees.z = peckAngleUp
	
	#print (leftFacing)
	#print (mesh_instance_3d___body.rotation.y)
	

func fillRadialMenuFromInventory():
	#var tempNode = newPlayerInstance.get_node("Node3D - CameraLookAt").get_parent()
	#tempNode.wormManager = wormManager
	var tempNode

	tempNode = radialMenuInstance.get_node("Node3D - Radial NW").get_node("Label3D NW")
	if playerInventory.inventory.size() < 8:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[7].text
	
	tempNode = radialMenuInstance.get_node("Node3D - Radial W").get_node("Label3D W")
	if playerInventory.inventory.size() < 7:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[6].text
	
	tempNode = radialMenuInstance.get_node("Node3D - Radial SW").get_node("Label3D SW")
	if playerInventory.inventory.size() < 6:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[5].text
	
	tempNode = radialMenuInstance.get_node("Node3D - Radial S").get_node("Label3D S")
	if playerInventory.inventory.size() < 5:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[4].text
	
	tempNode = radialMenuInstance.get_node("Node3D - Radial SE").get_node("Label3D SE")
	if playerInventory.inventory.size() < 4:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[3].text
	
	tempNode = radialMenuInstance.get_node("Node3D - Radial E").get_node("Label3D E")
	if playerInventory.inventory.size() < 3:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[2].text
	
	tempNode = radialMenuInstance.get_node("Node3D - Radial NE").get_node("Label3D NE")
	if playerInventory.inventory.size() < 2:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[1].text
	
	tempNode = radialMenuInstance.get_node("Node3D - Radial N").get_node("Label3D N")
	if playerInventory.inventory.size() < 1:
		tempNode.text = ""
	else:
		tempNode.text = playerInventory.inventory[0].text

	
	for n in playerInventory.inventory.size():
		print (playerInventory.inventory[n].text)
