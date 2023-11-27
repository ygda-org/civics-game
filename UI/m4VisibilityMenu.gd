extends Control

var newPauseState

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	$brightnessSlider.value = MainGlobals.brightness
	$contrastSlider.value = MainGlobals.contrast
	$saturationSlider.value = MainGlobals.saturation
func _input(event):
	if event.is_action_pressed("pause") && visible:
		$Return.grab_focus()
		newPauseState = !get_tree().paused
		get_tree().paused = newPauseState
		visible = false
		get_parent().get_node("Pause").visible = true
	if event.is_action_pressed("first") && visible:
		$brightnessSlider.grab_focus()
	if event.is_action_pressed("second") && visible:
		$contrastSlider.grab_focus()
	if event.is_action_pressed("third") && visible:
		$saturationSlider.grab_focus()
	if event.is_action_pressed("fourth") && visible:
		$Reset.grab_focus()
		get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = 1
		get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = 1
		get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = 1
		MainGlobals.brightness = 1
		MainGlobals.contrast = 1
		MainGlobals.saturation = 1
		$brightnessSlider.value = MainGlobals.brightness
		$contrastSlider.value = MainGlobals.contrast
		$saturationSlider.value = MainGlobals.saturation

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_brightnessSlider_value_changed(value:float) -> void:
	get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = value
	MainGlobals.brightness = value
	
	
func _on_contrastSlider_value_changed(value:float) -> void:
	get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = value
	MainGlobals.contrast = value

func _on_saturationSlider_value_changed(value:float) -> void:
	get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = value
	MainGlobals.saturation = value

func _on_Reset_pressed():
	get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = 1
	get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = 1
	get_parent().get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = 1
	MainGlobals.brightness = 1
	MainGlobals.contrast = 1
	MainGlobals.saturation = 1
	$brightnessSlider.value = MainGlobals.brightness
	$contrastSlider.value = MainGlobals.contrast
	$saturationSlider.value = MainGlobals.saturation


func _on_Return_pressed():
	visible = false
	get_parent().get_node("Pause").visible = true
