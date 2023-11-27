extends Control

var newPauseState

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _input(event):
	if (event.is_action_pressed("pause") || (event.is_action_pressed("first") && visible)) and not DialogManager.is_dialog_active:
		print(DialogManager.is_dialog_active)
		if get_tree().paused == false:
			GodotTTS.speak("Press 1 to resume. Press 2 to change volume. Press 3 to go to visibility settings. Press 4 to exit")
		$Resume.grab_focus()
		newPauseState = !get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState
	if event.is_action_pressed("second") && visible:
		$VolumeSlider.grab_focus()
	if event.is_action_pressed("third") && visible:
		$Visibility.grab_focus()
		visible = false
		get_parent().get_node("VisibilityMenu").visible = true
	if event.is_action_pressed("fourth") && visible:
		$Exit.grab_focus()
		newPauseState = !get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState
		MainGlobals.menusongpos = 0
		if "MainWorld" in str(get_tree().current_scene):
			get_tree().change_scene("res://UI/MainMenu.tscn")
		else:
			get_tree().change_scene("res://Areas/MainWorld.tscn")

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


func _on_pause_pressed():
	if not DialogManager.is_dialog_active:
		newPauseState = !get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState
