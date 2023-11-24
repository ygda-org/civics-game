extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var clickable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Label.visible = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if clickable:
		if(Input.is_action_just_pressed("click") and not get_parent().bothTilesActive):
			get_parent().receive_text($Control/Label.text)
			$Control/Disabled.visible = false
			$Control/Enabled.visible = true
			


func _on_Control_mouse_entered():
	clickable = true
	#print("hi") # Replace with function body.


func _on_Control_mouse_exited():
	clickable = false # Replace with function body.
