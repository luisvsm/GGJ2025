class_name Leaf extends Node3D

@onready var leafNodeParent: Node3D = $LeafNodes
	
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

func _ready() -> void:
	GrowBranch([])
	
func GrowBranch(treeEffects:Array[TreeEffect]):
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
		
		
