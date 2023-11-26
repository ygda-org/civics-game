extends Control


func _input(event):
	if Input.is_action_pressed("first"):
		MainGlobals.firstplay = false
		get_parent().find_node("playermenu").playmvt()
	if Input.is_action_pressed("second"):
		get_parent().find_node("intro").stop()
		MainGlobals.firstplay = false
		get_tree().change_scene("res://UI/optionsmenu.tscn")
	if Input.is_action_pressed("third"):
		get_parent().find_node("intro").stop()
		MainGlobals.firstplay = false
		get_tree().change_scene("res://UI/Credits.tscn")
	
func _on_Start_pressed():
	MainGlobals.firstplay = false
	get_parent().find_node("playermenu").playmvt()


func _on_Options_pressed():
	get_parent().find_node("intro").stop()
	MainGlobals.firstplay = false
	get_tree().change_scene("res://UI/optionsmenu.tscn")


func _on_Credits_pressed():
	get_parent().find_node("intro").stop()
	MainGlobals.firstplay = false
	get_tree().change_scene("res://UI/Credits.tscn")


func _on_walkingtime_timeout():
	get_parent().find_node("intro").stop()
	MainGlobals.firstplay = false
	MenuSong.stop()
	get_tree().change_scene("res://Areas/MainWorld.tscn")
