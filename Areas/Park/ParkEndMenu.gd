extends Node2D

func _ready():
	get_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	get_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	get_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	MainGlobals.parkwin = true
	var toSpeak
	if ParkGlobals.isWin == true:
		toSpeak = "Congrats! You got all 10 pieces!"
		$Result.bbcode_text = 	"[center] " + "Congrats! You got all 10 pieces!"+ " [/center]"
		$stars.play("three")
		$win.play()
	elif ParkGlobals.score >= 5:
		toSpeak = "Great job! You got" + str(ParkGlobals.score) + " out of 10 pieces!"
		$Result.bbcode_text = 	"[center] " + "Great job! You got " + str(ParkGlobals.score) + " out of 10 pieces!" + " [/center]"	
		$stars.play("two")
		$win.play()
	else:
		toSpeak = "You got " + str(ParkGlobals.score) + " out of 10 pieces!"
		$Result.bbcode_text = 	"[center] " + "You got " + str(ParkGlobals.score) + " out of 10 pieces!" + " [/center]"	
		$stars.play("one")
		$lose.play()
	GodotTTS.speak(toSpeak+ "Press r to restart. Press escape to go to main menu")

func _input(event):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Areas/Park/Park.tscn")
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://Areas/MainWorld.tscn")
		
func _on_Exit_pressed():
	get_tree().change_scene("res://Areas/MainWorld.tscn")



func _on_Restart_pressed():
	get_tree().change_scene("res://Areas/Park/Park.tscn")
