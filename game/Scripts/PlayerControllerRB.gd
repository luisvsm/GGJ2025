class_name Player
extends RigidBody3D
#@onready var mesh_instance_3d___body: MeshInstance3D = $"MeshInstance3D - Body"
@onready var node_3d___body: Node3D = $"Node3D - Body"
@onready var node_3d___tail: Node3D = $"Node3D - Body/Node3D - Tail"
@onready var node_3d___head: Node3D = $"Node3D - Body/Node3D - Head"
#@onready var node_3d___worm_connection: Node3D = $"Node3D - Body/Node3D - Head/Node3D - WormConnection"
#@onready var node_3d___radial_menu_parent: Node3D = $"Node3D - Radial Menu Parent"
@onready var node_3d___wing_l: Node3D = $"Node3D - Body/Node3D - WingL"
@onready var node_3d___wing_r: Node3D = $"Node3D - Body/Node3D - WingR"

@export var moveForce: float
@export var jumpForce:float
@export var jumpCoolDown:float
@export var tailFlapCoolDown:float
@export var tailFlapAngleUp:float
@export var tailFlapAngleDown:float
@export var wingFlapAngleUp:float
@export var wingFlapAngleDown:float
@export var peckAngleUp:float
@export var peckAngleDown:float
@export var maxInventory:int

@export var nextWormTimerRangeMin: float
@export var nextWormTimerRangeMax: float
var timePassedSinceLastWorm: float
var currentNextWormTimer: float

#@export var wormConnectionPoint:Vector3
@export var testTextLebel: Label3D
@export var testTextDuration: float

@export var playerInventory: Inventory
@export var wormManager: WormManager
#@export var radialMenuPrefab: Node3D
var radialMenuInstance:RadialMenu
var radialMenuPrefab:PackedScene

@export var treeInstance: gameTree


var rng = RandomNumberGenerator.new()

var currentWorm: Node
var closetLeafPlatform:LeafPlatform
var jumpCoolDownTimer:float = 0
var jumped: bool = false
var leftFacing = true
var TailFlapCoolDownTimer:float = 0
var tailFlapping = false
var pecking = false
var canPeck = false
var textResetTime:int

var leftStickHAxis: float
var deltaMoveVector: Vector3 = Vector3(0, 0, 0)

var radialMenuVisible: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	continuous_cd = true
	radialMenuPrefab = load("res://Prefabs//Radial Menu.tscn")
	
	node_3d___tail.rotation.z = tailFlapAngleDown
	node_3d___wing_l.rotation.z = wingFlapAngleDown
	node_3d___wing_r.rotation.z = wingFlapAngleDown
	currentNextWormTimer = rng.randf_range(nextWormTimerRangeMin, nextWormTimerRangeMax)
	print(currentNextWormTimer)	
	#node_3d___radial_menu_parent.set_process(false)
	#wormConnectionPoint = node_3d___worm_connection.position
	#print (wormConnectionPoint)
	#gravity_scale = 5



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if textResetTime > 0 && Time.get_ticks_msec() > textResetTime:
		testTextLebel.text = ""
		textResetTime = 0
		
	if radialMenuVisible:
		closetLeafPlatform = treeInstance.GetClosestLeafPlatform(global_position, 1)
		fillRadialMenuFromInventory(closetLeafPlatform)
		
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
				AudioManager.PlaySound("flap")
				jumped = true
				tailFlapping = true

	if Input.get_action_strength("peck") > 0:
		if jumped == false:
			if canPeck == true:
				pecking = true
	else:
		pecking = false
	
	
	
	if Input.is_action_just_pressed("debug_place_word"):
		closetLeafPlatform = treeInstance.GetClosestLeafPlatform(global_position, 1)
	
		if (radialMenuInstance != null):
			radialMenuVisible = false
			radialMenuInstance.queue_free()
			closetLeafPlatform = null
		else:
			radialMenuVisible = true
			radialMenuInstance = radialMenuPrefab.instantiate()
			add_child(radialMenuInstance)
			fillRadialMenuFromInventory(closetLeafPlatform)
	
	if closetLeafPlatform != null && radialMenuVisible == true:
		if Input.is_action_just_pressed("debug_selsect_1"):
			if playerInventory.inventory.size() >= 1:
				AddBranchToLeafPlatform(playerInventory.inventory[0])
				playerInventory.inventory.remove_at(0)
		if Input.is_action_just_pressed("debug_selsect_2"):
			if playerInventory.inventory.size() >= 2:
				AddBranchToLeafPlatform(playerInventory.inventory[1])
				playerInventory.inventory.remove_at(1)
		if Input.is_action_just_pressed("debug_selsect_3"):
			if playerInventory.inventory.size() >= 3:
				AddBranchToLeafPlatform(playerInventory.inventory[2])
				playerInventory.inventory.remove_at(2)
		if Input.is_action_just_pressed("debug_selsect_4"):
			if playerInventory.inventory.size() >= 4:
				AddBranchToLeafPlatform(playerInventory.inventory[3])
				playerInventory.inventory.remove_at(3)
		if Input.is_action_just_pressed("debug_selsect_5"):
			if playerInventory.inventory.size() >= 5:
				AddBranchToLeafPlatform(playerInventory.inventory[4])
				playerInventory.inventory.remove_at(4)
		if Input.is_action_just_pressed("debug_selsect_6"):
			if playerInventory.inventory.size() >= 6:
				AddBranchToLeafPlatform(playerInventory.inventory[5])
				playerInventory.inventory.remove_at(5)
		if Input.is_action_just_pressed("debug_selsect_7"):
			if playerInventory.inventory.size() >= 7:
				AddBranchToLeafPlatform(playerInventory.inventory[6])
				playerInventory.inventory.remove_at(6)
		if Input.is_action_just_pressed("debug_selsect_8"):
			if playerInventory.inventory.size() >= 8:
				AddBranchToLeafPlatform(playerInventory.inventory[7])
				playerInventory.inventory.remove_at(7)
		
		
		
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
		node_3d___wing_l.rotation_degrees.z = wingFlapAngleUp*-1
		node_3d___wing_r.rotation_degrees.z = wingFlapAngleUp
	if tailFlapping == false:
		node_3d___tail.rotation_degrees.z = tailFlapAngleDown
		node_3d___wing_l.rotation_degrees.z = wingFlapAngleDown*-1
		node_3d___wing_r.rotation_degrees.z = wingFlapAngleDown
		
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
	

func AddBranchToLeafPlatform(word:Word)->void:
	if StringTemplate.DoesThisWordFitTheSentance(closetLeafPlatform.templateString, word) == true:
		testTextLebel.text = word.text
		textResetTime = Time.get_ticks_msec() + (testTextDuration * 1000)
		print (word.text)
		
	var sentanceNeedsMoreWords = closetLeafPlatform.AddWordToTemplate(word)
	print("sentanceNeedsMoreWords: %s"%sentanceNeedsMoreWords)
	if sentanceNeedsMoreWords == false:
		AudioManager.PlaySound("success-sentence")
		closetLeafPlatform.branchIsComplete = true
		treeInstance.GrowNumberOfBranch(closetLeafPlatform)
	else:
		AudioManager.PlaySound("success-word")
	
	closetLeafPlatform = null
	radialMenuVisible = false
	radialMenuInstance.queue_free()
	closetLeafPlatform = null

func fillRadialMenuFromInventory(platform:LeafPlatform):
	#var tempNode = newPlayerInstance.get_node("Node3D - CameraLookAt").get_parent()
	#tempNode.wormManager = wormManager
	var tempNode
	
	if platform == null:
		radialMenuInstance.setLabelsDisabled()
	else:
		radialMenuInstance.setLabelsEnabled()
		radialMenuInstance.highlightWordsThatCanBeUsed(playerInventory.inventory, platform.templateString)
		

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
