class_name Word

var tags:Array[String]
var text:String
var treeEffects:Array[TreeEffect]

static func create(Inputtext:String,Inputtags:Array[String],InputtreeEffects:Array[TreeEffect]) -> Word:
	var word = Word.new()
	word.tags = Inputtags
	word.text = Inputtext
	word.treeEffects = InputtreeEffects
	return word
