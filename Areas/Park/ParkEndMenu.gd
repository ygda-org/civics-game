extends Control

func _ready():
	MainGlobals.parkwin = true
	if ParkGlobals.isWin == true:
		$Result.bbcode_text = 	"[center] " + "Congrats! You got all 10 pieces!"+ " [/center]"
		$stars.play("three")
	elif ParkGlobals.score >= 5:
		$Result.bbcode_text = 	"[center] " + "Great job! You got " + str(ParkGlobals.score) + " out of 10 pieces!" + " [/center]"	
		$stars.play("two")
	else:
		$Result.bbcode_text = 	"[center] " + "You got " + str(ParkGlobals.score) + " out of 10 pieces!" + " [/center]"	
		$stars.play("one")
	
func _input(event):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Areas/Park/Park.tscn")
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://Areas/MainWorld.tscn")
		
func _on_Exit_pressed():
	get_tree().change_scene("res://Areas/MainWorld.tscn")



func _on_Restart_pressed():
	get_tree().change_scene("res://Areas/Park/Park.tscn")
