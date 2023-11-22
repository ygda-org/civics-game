extends Control

var newPauseState

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
func _input(event):
	if event.is_action_pressed("pause"):
		newPauseState = !get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState


func _on_Resume_pressed():
	newPauseState = !get_tree().paused
	get_tree().paused = newPauseState
	visible = newPauseState
	
func _on_Exit_pressed():
	newPauseState = !get_tree().paused
	get_tree().paused = newPauseState
	visible = newPauseState
	get_tree().change_scene("res://Areas/MainWorld.tscn")
