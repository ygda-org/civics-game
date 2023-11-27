extends Control

var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()

func _ready():
	add_child(sfx_manager)

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
	if !sfx_manager.is_sfx_playing("menu_select"):
			sfx_manager.stop_sfx("menu_select")
			sfx_manager.play_sfx("menu_select")
	MainGlobals.firstplay = false
	get_parent().find_node("playermenu").playmvt()


func _on_Options_pressed():
	if !sfx_manager.is_sfx_playing("menu_select"):
			sfx_manager.stop_sfx("menu_select")
			sfx_manager.play_sfx("menu_select")
	get_parent().find_node("intro").stop()
	MainGlobals.firstplay = false
	get_tree().change_scene("res://UI/optionsmenu.tscn")


func _on_Credits_pressed():
	if !sfx_manager.is_sfx_playing("menu_select"):
			sfx_manager.stop_sfx("menu_select")
			sfx_manager.play_sfx("menu_select")
	get_parent().find_node("intro").stop()
	MainGlobals.firstplay = false
	get_tree().change_scene("res://UI/Credits.tscn")


func _on_walkingtime_timeout():
	get_parent().find_node("intro").stop()
	MainGlobals.firstplay = false
	MenuSong.stop()
	get_tree().change_scene("res://Areas/MainWorld.tscn")


func _on_Start_mouse_entered():
	if !sfx_manager.is_sfx_playing("menu_move"):
			sfx_manager.stop_sfx("menu_move")
			sfx_manager.play_sfx("menu_move")

func _on_Start_mouse_exited():
	sfx_manager.stop_sfx("menu_move")

func _on_Options_mouse_entered():
	if !sfx_manager.is_sfx_playing("menu_move"):
			sfx_manager.stop_sfx("menu_move")
			sfx_manager.play_sfx("menu_move")

func _on_Options_mouse_exited():
	sfx_manager.stop_sfx("menu_move")

func _on_Credits_mouse_entered():
	if !sfx_manager.is_sfx_playing("menu_move"):
			sfx_manager.stop_sfx("menu_move")
			sfx_manager.play_sfx("menu_move")

func _on_Credits_mouse_exited():
	sfx_manager.stop_sfx("menu_move")
