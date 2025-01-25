class_name Leaf extends Node3D

@onready var leafNodeParent: Node3D = $LeafNodes
var leafNodes:Array[Node3D] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for leaf in leafNodeParent.get_children():
		leafNodes.append(leaf)
	
func SetLeafMesh(newMesh:Array[Mesh]):
	var meshToUse = newMesh.pick_random()
