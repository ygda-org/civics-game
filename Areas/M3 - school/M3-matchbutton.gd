extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inRange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("click") and inRange):
		get_parent().on_match()

func _on_M3_matchButton_mouse_exited():
	inRange = false # Replace with function body.


func _on_M3_matchButton_mouse_entered():
	inRange = true 
