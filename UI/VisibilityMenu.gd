extends Control

var newPauseState

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
func _input(event):
	if event.is_action_pressed("pause") && visible:
		newPauseState = !get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_brightnessSlider_value_changed(value:float) -> void:
	get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = value

func _on_contrastSlider_value_changed(value:float) -> void:
	get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = value

func _on_saturationSlider_value_changed(value:float) -> void:
	get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = value

func _on_Reset_pressed():
	get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_brightness = 1
	get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = 1
	get_parent().get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = 1
