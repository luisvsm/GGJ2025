extends VBoxContainer
@onready var text_edit: TextEdit = $TextEdit

@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var label_3: Label = $Label3
@onready var label_4: Label = $Label4
@onready var label_5: Label = $Label5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	ProcessText()
	
func _on_text_edit_text_changed() -> void:
	ProcessText()
	
func ProcessText() -> void:
	label.text = StringTemplate.Process(text_edit.text)
	label_2.text = StringTemplate.Process(text_edit.text)
	label_3.text = StringTemplate.Process(text_edit.text)
	label_4.text = StringTemplate.Process(text_edit.text)
	label_5.text = StringTemplate.Process(text_edit.text)
