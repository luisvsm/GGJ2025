class_name LeafPlatform extends Node3D

@onready var leafNodeParent: Node3D = $LeafNodes
@onready var branch_attachment_points: Node3D = $BranchAttachmentPoints
var branch:Branch

@export var platformSize:float
var rng = RandomNumberGenerator.new()
static var leafMeshByColourAndType:Dictionary = {
	TreeEffect.LeafColours.TeaGreen:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.ForestGreen:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.SkyBlue:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.OlympicBlue:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.CandyRed:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.CurrantRed:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.PineappleYellowBlending:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.Dijon:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.CadmiumWhite:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.Grey:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.SlateGrey:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.Coal:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.TigerOrange:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	TreeEffect.LeafColours.Bronze:{
		TreeEffect.LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		TreeEffect.LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
}

#func _ready() -> void:
	#GrowLeaf([])
	#GetAttachmentPoint()
	
func GrowLeaf(treeEffects:Array[TreeEffect]):
	var leafShapes:Array = []
	var leafColours:Array = []
	var numberOfBranches = 1
	
	for effect in treeEffects:
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
