extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	print ("hello")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.canPeck = true
		print("!!!!!!!!!")


func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		body.canPeck = false
		print("###########")
