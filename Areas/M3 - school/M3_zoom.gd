extends Node2D



var inrange = false
var active = false


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(active and ((inrange and Input.is_action_just_pressed("click")) or Input.is_action_just_pressed("back"))):
		print("yes")
		visible = false
		active = false
		inrange = false
		get_parent().zoomed = false

func _on_back_mouse_entered():
	if active: 
		inrange = true# Replace with function body.


func _on_back_mouse_exited():
	inrange = false# Replace with function body.
