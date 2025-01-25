extends Node

#Prevent needing to reference elsewhere
var player_Node:Node = null
var WordlistScript:Script

#Inventory Array (didn't make resizable)
var inventory = []

#Possibly use later to easily work out which types will be in which slots?
#Eg Maybe max hold 2 nouns, 2 adjs, 2, verbs
#@export var word_type
#@export var word_effect
#var scenepath:String = "res://Scenes/inventory.tscn"

func _addWord():
	pass

func _removeWord():
	pass

#Add a reference into the player script to set the ref:
#inventory.SetPlayerReference.self
func _setPlayerReference(player):
	player_Node = player
