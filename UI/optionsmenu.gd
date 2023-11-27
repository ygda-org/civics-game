extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GodotTTS.speak("Press 1 to go to volume settings")
	GodotTTS.speak("Press 2 to go to visibility settings")
	MenuSong.play(MainGlobals.menusongpos)
func _process(delta):
	MainGlobals.menusongpos = MenuSong.get_playback_position()

func _input(event):
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://UI/MainMenu.tscn")
	if Input.is_action_pressed("second"):
		get_tree().change_scene("res://UI/mainscreenvisibility.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Volume_pressed():
	pass # Replace with function body.


func _on_Back_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")


func _on_Display_pressed():
	get_tree().change_scene("res://UI/mainscreenvisibility.tscn")
