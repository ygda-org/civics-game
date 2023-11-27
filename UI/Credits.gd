extends Control

func _ready():
	GodotTTS.speak("Press escape to go back. Credits Young Game Developers Association")
	MenuSong.play(MainGlobals.menusongpos)
func _process(delta):
	MainGlobals.menusongpos = MenuSong.get_playback_position()
	
func _on_Back_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")

func _input(event):
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://UI/MainMenu.tscn")
