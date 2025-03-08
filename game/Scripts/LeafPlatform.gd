class_name LeafPlatform extends Node3D

const FALLING_LEAVES = preload("res://art_assets/VFX/FallingLeaves.tscn")
@onready var leaf_text: Label3D = $LeafText
@onready var leafNodeParent: Node3D = $LeafNodes
@onready var branch_attachment_points: Node3D = $BranchAttachmentPoints
var branch:Branch
var templateString:String
var treeEffects:Array[TreeEffect] = []
var branchIsComplete = false

@export var platformSize:float
var rng = RandomNumberGenerator.new()
static var leafMeshByColourAndType:Dictionary = {
	TreeEffect.LeafColours.TeaGreen:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Final/MapleLeaf_TeaGreen.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Final/BasicLeaf_TeaGreen.obj")
	},
	TreeEffect.LeafColours.CandyRed:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Final/MapleLeaf_CandyRed.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Final/BasicLeaf_CandyRed.obj")
	},
	TreeEffect.LeafColours.PineappleYellowBlending:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Final/MapleLeaf_PinappleYellow.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Final/BasicLeaf_PineappleYellow.obj")
	},
	TreeEffect.LeafColours.CadmiumWhite:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Final/MapleLeaf_CadmiumWhite.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Final/BasicLeaf_CadmiumWhite.obj")
	},
	TreeEffect.LeafColours.Grey:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Final/MapleLeaf_Grey.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Final/BasicLeaf_Grey.obj")
	},
	TreeEffect.LeafColours.TigerOrange:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Final/MapleLeaf_TigerPrange.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Final/BasicLeaf_TigerOrange.obj")
	},
	TreeEffect.LeafColours.Bronze:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Final/MapleLeaf_Bronze.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Final/BasicLeaf_Bronze.obj")
	},
}

func _ready() -> void:
	templateString = StringTemplate.Process(StringTemplate.TemplateList.pick_random())
	UpdateTemplateText()

func AddWordToTemplate(word:Word) -> bool:
	print("AddWordToTemplate: %s"%word.text)
	if StringTemplate.DoesThisWordFitTheSentance(templateString, word) == false:
		print("Word does not fit the sentance")
		return true
		
	print("before templateString: %s"%templateString)
	treeEffects.append_array(word.treeEffects)
	templateString = StringTemplate.AddWord(templateString, word)
	print("after templateString: %s"%templateString)
	UpdateTemplateText()
	var openingBracket = templateString.find("[")
	var closingBracket = templateString.find("]")
	var sentanceIsNotComplete = openingBracket >= 0 && closingBracket >= 0
	if sentanceIsNotComplete == false:
		var leafShapes:Array = []
		var leafColours:Array = []
		
		for effect in treeEffects:
			if effect.type == TreeEffect.EffectType.leafColour:
				leafColours.append(effect.value)
			elif effect.type == TreeEffect.EffectType.leafShape:
				leafShapes.append(effect.value)
				
		var newLeafParticles = FALLING_LEAVES.instantiate()
		if leafColours.size() == 0:
			leafColours.append(TreeEffect.LeafColours.TeaGreen)
			
		if leafShapes.size() == 0:
			leafShapes.append(TreeEffect.LeafShape.Fig)
			
		var leafColourOne = leafColours.pick_random()
		var leafShapeOne = leafShapes.pick_random()
		var leafColourTwo = leafColours.pick_random()
		var leafShapeTwo = leafShapes.pick_random()
		
		if leafMeshByColourAndType.get(leafColourOne) == null:
			leafColourOne = TreeEffect.LeafColours.TeaGreen
		if leafMeshByColourAndType[leafColourOne].get(leafShapeOne) == null:
			leafShapeOne = TreeEffect.LeafShape.Fig
			
			
		if leafMeshByColourAndType.get(leafColourTwo) == null:
			leafColourTwo = TreeEffect.LeafColours.TeaGreen
		if leafMeshByColourAndType[leafColourTwo].get(leafShapeTwo) == null:
			leafShapeTwo = TreeEffect.LeafShape.Fig
		
		newLeafParticles.SetMeshes(
			leafMeshByColourAndType[leafColourOne][leafShapeOne],
			leafMeshByColourAndType[leafColourTwo][leafShapeTwo]
		)
			
		add_child(newLeafParticles)
		
	return sentanceIsNotComplete

func UpdateTemplateText() -> void:
	leaf_text.text = StringTemplate.HidePlayerBrackets(templateString)

func GrowLeaf(inputTreeEffects:Array[TreeEffect]):
	var leafShapes:Array = []
	var leafColours:Array = []
	var numberOfBranches = 1
	
	for effect in inputTreeEffects:
		if effect.type == TreeEffect.EffectType.leafColour:
			leafColours.append(effect.value)
		elif effect.type == TreeEffect.EffectType.leafShape:
			leafShapes.append(effect.value)
		elif effect.type == TreeEffect.EffectType.numberOfBranches:
			numberOfBranches += int(effect.value)
		elif effect.type == TreeEffect.EffectType.leafPattern:
			print("TODO Handle patterns")
			
	if leafColours.size() == 0:
		leafColours.append(TreeEffect.LeafColours.ForestGreen)
		
	if leafShapes.size() == 0:
		leafShapes.append(TreeEffect.LeafShape.Fig)
		
	
	print("leafNodeParent.get_children()!")
	for leaf in leafNodeParent.get_children():
		leaf.mesh = leafMeshByColourAndType[leafColours.pick_random()][leafShapes.pick_random()]

func CountAttachmentPoints() -> int:
	return branch_attachment_points.get_children().size()

func RemoveAttachmentPoint(attach:Node3D):
	if attach.get_parent_node_3d() == branch_attachment_points:
		branch_attachment_points.remove_child(attach)
		
	if attach.get_parent_node_3d() == branch.attachment_points:
		branch.attachment_points.remove_child(attach)
		

func GetAttachmentPoint() -> Node3D:
	var attachmentPoint:Node3D = null
	
	if rng.randf() > 0.5 && branch.attachment_points.get_children().size() > 0:
		print("Branch attachment")
		attachmentPoint = branch.attachment_points.get_children().pick_random()
	elif branch_attachment_points.get_children().size() > 0:
		print("leaf attachment")
		attachmentPoint = branch_attachment_points.get_children().pick_random()
	
	return attachmentPoint
