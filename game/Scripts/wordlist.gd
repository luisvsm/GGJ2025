extends Node

class_name WordList
var Wordlist:Array[Word]

# Constructor array of tree effects coming from treeEffects to assign to word
func _ready():
	Wordlist.append(
		Word.create(
			"Light",
			["Text", "noun"],
			[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
		)
	)
