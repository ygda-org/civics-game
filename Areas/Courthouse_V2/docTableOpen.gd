extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text = "You have chosen case 0"
var info = ". Press i to view Info"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false # Replace with function body.

func choose_case(num):
	text = text.substr(0, len(text)-2)
	text += " " + str(num)
	$Label.text = text + info
	$Label.visible = true
	
func _process(delta):
	if Input.is_action_just_pressed("back"):
		visible = false
		get_parent().get_node("Player").frozen = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
