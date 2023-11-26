extends Node2D


func _ready():
	GodotTTS.speak("Press 1 to start.")
	GodotTTS.speak("Press 2 to go to options")
	GodotTTS.speak("Press 3 to go to credits")
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation


