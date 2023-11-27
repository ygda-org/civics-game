extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var clickable = false
export var number: String


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Label.visible = false # Replace with function body.
	$Control/number.text = {"first" : "1", "second" : "2", "third" : "3", "fourth" : "4", "fifth" : "5", "sixth" : "6"}[number]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_node("CanvasLayer/unpause").time_left<= 0:
		if clickable and get_parent().zoomed == false and visible:
			if(Input.is_action_just_pressed("click") and get_parent().get_node("CanvasLayer/Pause").visible == false and $Control/Enabled.visible):
				get_parent().zoom($Control/Label.text)	
				clickable = false
			elif(Input.is_action_just_pressed("click") and get_parent().get_node("CanvasLayer/Pause").visible == false and not get_parent().bothTilesActive):
				get_parent().receive_text($Control/Label.text)
				$Control/Disabled.visible = false
				$Control/Enabled.visible = true
				clickable = false
		if get_parent().zoomed == false and visible:
			if(Input.is_action_just_pressed(number) and $Control/Enabled.visible and get_parent().get_node("CanvasLayer/Pause").visible == false):
				get_parent().zoom($Control/Label.text)	
				clickable = false
			elif(Input.is_action_just_pressed(number) and get_parent().get_node("CanvasLayer/Pause").visible == false and not get_parent().bothTilesActive):
				get_parent().receive_text($Control/Label.text)
				$Control/Disabled.visible = false
				$Control/Enabled.visible = true
				clickable = false
			


func _on_Control_mouse_entered():
	if not get_parent().zoomed:
		clickable = true
	#print("hi") # Replace with function body.


func _on_Control_mouse_exited():
	#print("out")
	clickable = false # Replace with function body.
