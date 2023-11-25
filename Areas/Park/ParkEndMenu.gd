extends Control

func _ready():
	if ParkGlobals.isWin == true:
		$Result.bbcode_text = 	"[center] " + "You got all 10 pieces!"+ " [/center]"
	else:
		$Result.bbcode_text = 	"[center] " + "You only got " + str(ParkGlobals.score) + " out of 10 pieces!" + " [/center]"	
	
func _input(event):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Areas/Park/Park.tscn")
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://Areas/MainWorld.tscn")
		
func _on_Exit_pressed():
	get_tree().change_scene("res://Areas/MainWorld.tscn")



func _on_Restart_pressed():
	get_tree().change_scene("res://Areas/Park/Park.tscn")
