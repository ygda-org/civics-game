extends Control


func _ready():
	MainGlobals.townsquarewin = true
	if M4Globals.numhouses == 1:
		$Result.bbcode_text = 	"[center] " + "You got " + str(M4Globals.score) + " points and passed out flyers to 1 house!" + "[/center]"	
	else:
		$Result.bbcode_text = 	"[center] " + "You got " + str(M4Globals.score) + " points and passed out flyers to " + str(M4Globals.numhouses) + " houses!" + "[/center]"	
	if M4Globals.numhouses <= 1:
		$stars.play("one")
	elif M4Globals.numhouses >= 5 || M4Globals.get2mayor == true:
		$stars.play("three")
		M4Globals.win = true
	else:
		$stars.play("two")
	GodotTTS.speak("You got " + str(M4Globals.score) + " points and passed out flyers to " + str(M4Globals.numhouses) + " houses!")
	GodotTTS.speak("Press r to restart")
	GodotTTS.speak("Press escape to exit")
		
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
