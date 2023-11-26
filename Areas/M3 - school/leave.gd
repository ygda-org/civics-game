extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inreach = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if(((inreach and Input.is_action_just_pressed("click")) or Input.is_action_just_pressed("leave")) and not get_parent().zoomed):
		print("no")
		get_tree().change_scene("res://Areas/MainWorld.tscn")


func _on_leave_mouse_entered():
	inreach = true # Replace with function body.


func _on_leave_mouse_exited():
	inreach = false # Replace with function body.
