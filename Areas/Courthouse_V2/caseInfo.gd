extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func generateInfo(dict):
	visible = true
	var text = "Name: " + dict["Name"]
	if("Age" in dict):
		text += "\n" + "Age: " + dict["Age"]
	text += "\n" + "Case: " + dict["Case"]
	$Label.text = text

func _process(delta):
	if visible and Input.is_action_just_pressed("back"):
		visible = false
		get_parent().get_node("docTableOpen").visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
