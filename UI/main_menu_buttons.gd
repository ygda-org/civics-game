extends Node2D

var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()
var menu_move_playing = false

func _ready():
	add_child(sfx_manager)

func _on_button_area_mouse_entered():
	print("mouse touching!")
	if !menu_move_playing:
		sfx_manager.stop_sfx("menu_move")
		sfx_manager.play_sfx("menu_move")
		menu_move_playing = true

func _on_button_area_mouse_exited():
	sfx_manager.stop_sfx("menu_move")
	menu_move_playing = false
