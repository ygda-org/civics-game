extends Control


func _ready():
	get_parent().get_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	MainGlobals.courthousewin = true
	get_parent().get_node("win").play()
	$Result.bbcode_text = 	"[center] " + "Congrats! You successfully used your knowledge of the US Constitution to deliver correct verdicts!" + "[/center]"	
	GodotTTS.speak("Congrats! You successfully used your knowledge of the US Constitution to deliver correct verdicts! Press r to restart. Press escape to exit")
		
func _input(event):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Areas/Courthouse_V2/Courthouse2.tscn")
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://Areas/MainWorld.tscn")

func _on_Exit_pressed():
	get_tree().change_scene("res://Areas/MainWorld.tscn")



func _on_Restart_pressed():
	get_tree().change_scene("res://Areas/Courthouse_V2/Courthouse2.tscn")
