extends Control


func _input(event):
	if Input.is_action_pressed("first"):
		get_parent().find_node("playermenu").playmvt()
	if Input.is_action_pressed("second"):
		get_tree().change_scene("res://UI/optionsmenu.tscn")
	if Input.is_action_pressed("third"):
		get_tree().change_scene("res://UI/Credits.tscn")
	
func _on_Start_pressed():
	get_parent().find_node("playermenu").playmvt()


func _on_Options_pressed():
	get_tree().change_scene("res://UI/optionsmenu.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://UI/Credits.tscn")


func _on_walkingtime_timeout():
	get_tree().change_scene("res://Areas/MainWorld.tscn")
