extends Control


func _ready():
	get_parent().get_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	MainGlobals.schoolwin = true
	$Result.bbcode_text = 	"[center] " + "Great job! You're an A+ student!" + "[/center]"	
	GodotTTS.speak("Great job! You're an A+ student!")
	GodotTTS.speak("Press r to restart")
	GodotTTS.speak("Press escape to exit")
		
func _input(event):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Areas/M3 - school/M3-game.tscn")
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://Areas/MainWorld.tscn")

func _on_Exit_pressed():
	get_tree().change_scene("res://Areas/MainWorld.tscn")


func _on_Restart_pressed():
	get_tree().change_scene("res://Areas/M3 - school/M3-game.tscn")
