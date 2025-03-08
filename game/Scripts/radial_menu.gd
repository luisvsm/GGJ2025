class_name RadialMenu extends Node3D

@export var closeToBranchColour:Color
@export var farAwayFromBranchColour:Color
@export var wordCanBeUsedColour:Color

@onready var allLabels = [
	$"Node3D - Radial N/Label3D N",
	$"Node3D - Radial NE/Label3D NE",
	$"Node3D - Radial E/Label3D E",
	$"Node3D - Radial SE/Label3D SE",
	$"Node3D - Radial S/Label3D S",
	$"Node3D - Radial SW/Label3D SW",
	$"Node3D - Radial W/Label3D W",
	$"Node3D - Radial NW/Label3D NW",
]

func setLabelsEnabled():
	for lbl:Label3D in allLabels:
		lbl.modulate = closeToBranchColour
		
func setLabelsDisabled():
	for lbl:Label3D in allLabels:
		lbl.modulate = farAwayFromBranchColour

func highlightWordsThatCanBeUsed(inventory:Array[Word], templateString:String):
	for i in inventory.size():
		if StringTemplate.DoesThisWordFitTheSentance(templateString, inventory[i]) == true:
			allLabels[i].modulate = wordCanBeUsedColour
	

func _ready():
	setLabelsEnabled()
