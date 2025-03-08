extends Node

#Inventory Array (didn't make resizable)
var inventory:Array[Word] = []

#Possibly use later to easily work out which types will be in which slots?
#Eg Maybe max hold 2 nouns, 2 adjs, 2, verbs
#@export var word_type
#@export var word_effect
#var scenepath:String = "res://Scenes/inventory.tscn"

func AddWord() -> String:
	AudioManager.PlaySound("pullworm")
	var randomword = Wordlist.Wordlist.pick_random()
	inventory.append(randomword)
	return randomword.text

func RemoveRandomWord() -> String:
	var randomwword = inventory.pick_random()
	#inventory.remove_at()
	inventory.erase(randomwword)
	return randomwword.text
