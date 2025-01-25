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
	Red,
	Yellow,
	Green,
	Blue,
	Pink,
	Orange,
	White,
	Purple,
	Black,
	Indigo,
	Violet,
	Emerald,
	Ruby,
	Taupe,
	Cream,
	Topaz,
	Aqua,
	Silver,
	Copper,
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
