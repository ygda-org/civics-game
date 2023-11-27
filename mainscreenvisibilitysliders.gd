extends Control

var newPauseState


func _ready():
	GodotTTS.speak("Press 1 to change brightness. Press 2 to change contrast. Press 3 to change saturation. Press 4 to reset settings")
	$brightnessSlider.value = MainGlobals.brightness
	$contrastSlider.value = MainGlobals.contrast
	$saturationSlider.value = MainGlobals.saturation
	MenuSong.play(MainGlobals.menusongpos)
func _process(delta):
	MainGlobals.menusongpos = MenuSong.get_playback_position()
	
func _input(event):
	if event.is_action_pressed("first"):
		$brightnessSlider.grab_focus()
	if event.is_action_pressed("second"):
		$contrastSlider.grab_focus()
	if event.is_action_pressed("third"):
		$saturationSlider.grab_focus()
	if event.is_action_pressed("restart"):
		$Reset.grab_focus()
		get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = 1
		get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = 1
		get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = 1
		MainGlobals.brightness = 1
		MainGlobals.contrast = 1
		MainGlobals.saturation = 1
	if event.is_action_pressed("pause"):
		$Return.grab_focus()
		get_tree().change_scene("res://UI/optionsmenu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_brightnessSlider_value_changed(value:float) -> void:
	get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = value
	MainGlobals.brightness = value
	
	
func _on_contrastSlider_value_changed(value:float) -> void:
	get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = value
	MainGlobals.contrast = value

func _on_saturationSlider_value_changed(value:float) -> void:
	get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = value
	MainGlobals.saturation = value

func _on_Reset_pressed():
	get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = 1
	get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = 1
	get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = 1
	MainGlobals.brightness = 1
	MainGlobals.contrast = 1
	MainGlobals.saturation = 1


func _on_Return_pressed():
	get_tree().change_scene("res://UI/optionsmenu.tscn")
