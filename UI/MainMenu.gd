extends Control



func _on_Start_pressed():
	get_tree().change_scene("res://Areas/MainWorld.tscn")


func _on_Options_pressed():
	pass # Replace with function body.


func _on_Credits_pressed():
	get_tree().change_scene("res://UI/Credits.tscn")
