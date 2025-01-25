extends Node

static func Process(input:String)->String:
	var openingBracket = input.find("{")
	var closingBracket = input.find("}")
	if openingBracket >= 0 && closingBracket >= 0:
		var stringToReplace = input.substr(openingBracket+1, closingBracket-openingBracket-1)
		return Process(input.substr(0, openingBracket) + TagToWord(stringToReplace) + input.substr(closingBracket+1)) 
		
	return input
	
static func TagToWord(tagToReplace:String) -> String:
	print("TagToWord: %s"%tagToReplace)
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
	
