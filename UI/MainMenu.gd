extends Control

var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()
var startenabled = true

func _ready():
	GodotTTS.speak("Press 1 to start game. Press 2 to go to settings. Press 3 to go to credits.")
	add_child(sfx_manager)
	

func _process(delta):
	if not MainGlobals.startTTSPlayed and GodotTTS.ttsEnabled:
		GodotTTS.speak("Press 1 to start game. Press 2 to go to settings. Press 3 to go to credits.")
		MainGlobals.startTTSPlayed = true

func _input(event):
	if Input.is_action_just_pressed("first"):
		if !sfx_manager.is_sfx_playing("menu_select"):
			sfx_manager.stop_sfx("menu_select")
			sfx_manager.play_sfx("menu_select")
		MainGlobals.firstplay = false
		get_parent().find_node("playermenu").playmvt()
		startenabled = false
	if Input.is_action_pressed("second"):
		get_parent().find_node("intro").stop()
		MainGlobals.firstplay = false
		get_tree().change_scene("res://UI/optionsmenu.tscn")
	if Input.is_action_pressed("third"):
		get_parent().find_node("intro").stop()
		MainGlobals.firstplay = false
		get_tree().change_scene("res://UI/Credits.tscn")
	
func _on_Start_pressed():
	if !sfx_manager.is_sfx_playing("menu_select"):
			sfx_manager.stop_sfx("menu_select")
			sfx_manager.play_sfx("menu_select")
	MainGlobals.firstplay = false
	get_parent().find_node("playermenu").playmvt()
	startenabled = false


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

