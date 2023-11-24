extends TextureRect


var inRange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("click") and inRange):
		get_parent().on_reset()



func _on_M3_resetButton_mouse_entered():
	inRange = true


func _on_M3_resetButton_mouse_exited():
	inRange = false
