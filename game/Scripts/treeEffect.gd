class_name TreeEffect
# REMEMBER: Commas at the end of each listing line, indentation, 

enum EffectType{
	leafColour,
	leafShape,
	numberOfBranches,
	leafPattern,
}

var type:EffectType
var value

# RECAP: Constructor (taking input values and setting up a new instance
# In parameters stores all the possible instances to return to "wordlist"
static func create(Inputtype:EffectType,Inputvalue) -> TreeEffect:
	var newInstanceofTreeEffect = TreeEffect.new()
	newInstanceofTreeEffect.type = Inputtype
	newInstanceofTreeEffect.value = Inputvalue
	return newInstanceofTreeEffect

enum LeafColours{
	TeaGreen,
	ForestGreen,
	SkyBlue,
	OlympicBlue,
	CandyRed,
	CurrantRed,
	PineappleYellowBlending,
	Dijon,
	CadmiumWhite,
	Grey,
	SlateGrey,
	Coal,
	TigerOrange,
	Bronze,
}

enum LeafPattern{
	Stripes,
	Spots,
	Speckles,
}

enum LeafShape{
	Maple,
	Fig
}

var LeafMeshByColourAndType:Dictionary = {
	LeafColours.TeaGreen:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.ForestGreen:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.SkyBlue:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.OlympicBlue:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.CandyRed:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.CurrantRed:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.PineappleYellowBlending:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.Dijon:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.CadmiumWhite:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.Grey:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.SlateGrey:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.Coal:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.TigerOrange:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
	LeafColours.Bronze:{
		LeafShape.Maple:preload("res://art_assets/Leaf_Test_WithColour.obj"),
		LeafShape.Fig:preload("res://art_assets/Leaf_Test_WithColour.obj")
	},
}
