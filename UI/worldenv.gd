extends Node2D


func _ready():
	DialogManager.stopSFX = true
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation


