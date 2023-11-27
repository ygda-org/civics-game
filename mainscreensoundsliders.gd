extends Control

var newPauseState

onready var masterbus := AudioServer.get_bus_index("Master")

func _ready() -> void:
	GodotTTS.speak("Press 1 to change master volume. Press 2 to change music volume. Press 3 to change s f x volume. Press escape to go back")
	MenuSong.play(MainGlobals.menusongpos)
	
func _process(delta):
	MainGlobals.menusongpos = MenuSong.get_playback_position()
	
func _input(event):
	if event.is_action_pressed("first"):
		$masterSlider.grab_focus()
	if event.is_action_pressed("second"):
		$musicSlider.grab_focus()
	if event.is_action_pressed("third"):
		$sfxSlider.grab_focus()
	if event.is_action_pressed("pause"):
		$Return.grab_focus()
		get_tree().change_scene("res://UI/optionsmenu.tscn")




func _on_Return_pressed():
	get_tree().change_scene("res://UI/optionsmenu.tscn")
