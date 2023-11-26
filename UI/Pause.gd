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
	MainGlobals.menusongpos = 0
	if "MainWorld" in str(get_tree().current_scene):
		get_tree().change_scene("res://UI/MainMenu.tscn")
	else:
		get_tree().change_scene("res://Areas/MainWorld.tscn")

func _on_Visibility_pressed():
	visible = false
	get_parent().get_node("VisibilityMenu").visible = true
