extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inrange = false
var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(active and inrange and Input.is_action_just_pressed("click")):
		visible = false
		active = false
		inrange = false
		get_parent().zoomed = false

func _on_back_mouse_entered():
	if active: 
		inrange = true# Replace with function body.


func _on_back_mouse_exited():
	inrange = false# Replace with function body.
