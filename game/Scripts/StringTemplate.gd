extends Node

static var TemplateList:Array[String] = [
	"Look for the [object descriptor] [object], \n especially when it’s cloudy.",
	"{Adverb}, the [object] [verb].",
	"Far below, the [adjective] \n {object} [verb].",
	"Although it was {weather}, \n everyone but the [animal] [ending verb].",
	"Somewhere in the {environment} \n the [object] turned [colour].",
	"They hadn’t [verb] near the \n [colour] {environment} for some time.",
	"The [adjective] wind and \n [colour] sand [adverb] combined.",
	"The [object] was {adverb} \n hidden in the {colour} [environment].",
	"Under the {object descriptor} [object], \n the {animal} {ending verb}.",
	"Where the [collective noun] are, \n the [colour] wind blows.",
	"The {object}s may appear [object descriptor].",
	"A [animal] {verb} the [collective noun]",
	"[verb] is how the {object} felt.",
	"Why was the [object] {colour}? \n It's {weather}."
]

static func HidePlayerBrackets(input:String, bracketOpen:String = "[", bracketClose:String = "]")->String:
	var openingBracket = input.find(bracketOpen)
	var closingBracket = input.find(bracketClose)
	if openingBracket >= 0 && closingBracket >= 0:
		var _stringToReplace = input.substr(openingBracket+1, closingBracket-openingBracket-1)
		return HidePlayerBrackets("%s%s%s"%[
			input.substr(0, openingBracket),
			"____",
			input.substr(closingBracket+1)
		], bracketOpen, bracketClose)
		
	input[0] = input[0].to_upper()
	return input
	
static func Process(input:String, bracketOpen:String = "{", bracketClose:String = "}")->String:
	var openingBracket = input.find(bracketOpen)
	var closingBracket = input.find(bracketClose)
	if openingBracket >= 0 && closingBracket >= 0:
		var stringToReplace = input.substr(openingBracket+1, closingBracket-openingBracket-1)
		return Process("%s%s%s"%[
			input.substr(0, openingBracket),
			TagToWord(stringToReplace),
			input.substr(closingBracket+1)
			],
			bracketOpen,
			bracketClose
		) 
		
	return input
static func GetNextTag(input:String, bracketOpen:String = "[", bracketClose:String = "]") -> String:
	var openingBracket = input.find(bracketOpen)
	var closingBracket = input.find(bracketClose)
	if openingBracket >= 0 && closingBracket >= 0:
		return input.substr(openingBracket+1, closingBracket-openingBracket-1)
		
	return ""

static func DoesThisWordFitTheSentance(input:String, word:Word, bracketOpen:String = "[", bracketClose:String = "]")->bool:
	var openingBracket = input.find(bracketOpen)
	var closingBracket = input.find(bracketClose)
	if openingBracket >= 0 && closingBracket >= 0:
		var stringToReplace = input.substr(openingBracket+1, closingBracket-openingBracket-1)
		for tag in word.tags:
			if tag == stringToReplace:
				return true
		
	return false
	
static func AddWord(input:String, word:Word, bracketOpen:String = "[", bracketClose:String = "]")->String:
	var openingBracket = input.find(bracketOpen)
	var closingBracket = input.find(bracketClose)
	if openingBracket >= 0 && closingBracket >= 0:
		var stringToReplace = input.substr(openingBracket+1, closingBracket-openingBracket-1)
		for tag in word.tags:
			if tag == stringToReplace:
				return "%s%s%s"%[
					input.substr(0, openingBracket),
					word.text,
					input.substr(closingBracket+1)
				]
		
	return input
	
static func TagToWord(tagToReplace:String) -> String:
	var possibleWords:Array[Word] = []
	tagToReplace = tagToReplace.to_lower() 
	
	for word in Wordlist.Wordlist:
		for tag in word.tags:
			if tag == tagToReplace:
				possibleWords.append(word)
				
	if possibleWords.size() > 0:
		return possibleWords.pick_random().text
	else:
		return "<%s?>"%tagToReplace
