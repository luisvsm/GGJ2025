extends Node

class_name WordList

# Constructor array of tree effects coming from treeEffects to assign to word
static var Wordlist:Array[Word] = [
	Word.create(
		"Light",
		["Text", "noun"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	)
]
