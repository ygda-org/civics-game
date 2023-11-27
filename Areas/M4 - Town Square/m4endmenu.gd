extends Control


func _ready():
	get_parent().get_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	get_parent().find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	get_parent().find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	MainGlobals.townsquarewin = true
	if M4Globals.numhouses == 1:
		$Result.bbcode_text = 	"[center] " + "You got " + str(M4Globals.score) + " points and passed out flyers to 1 house!" + "[/center]"	
	else:
		$Result.bbcode_text = 	"[center] " + "You got " + str(M4Globals.score) + " points and passed out flyers to " + str(M4Globals.numhouses) + " houses!" + "[/center]"	
	if M4Globals.numhouses <= 1:
		$stars.play("one")
		get_parent().get_node("lose").play()
	elif M4Globals.numhouses >= 5 || M4Globals.get2mayor == true:
		$stars.play("three")
		M4Globals.win = true
		get_parent().get_node("win").play()
	else:
		$stars.play("two")
		get_parent().get_node("win").play()
	GodotTTS.speak("You got " + str(M4Globals.score) + " points and passed out flyers to " + str(M4Globals.numhouses) + " houses! Press r to restart. Press escape to exit")
		
func _input(event):
	if Input.is_action_pressed("restart"):
		M4Globals.score = 0
		M4Globals.get2mayor = false
		M4Globals.numhouses = 0
		get_tree().change_scene("res://Areas/M4 - Town Square/m4rev.tscn")
	if Input.is_action_pressed("pause"):
		M4Globals.score = 0
		get_tree().change_scene("res://Areas/MainWorld.tscn")

func _on_Exit_pressed():
	M4Globals.score = 0
	get_tree().change_scene("res://Areas/MainWorld.tscn")



func _on_Restart_pressed():
	M4Globals.score = 0
	get_tree().change_scene("res://Areas/M4 - Town Square/m4rev.tscn")
