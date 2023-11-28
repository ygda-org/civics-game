extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GodotTTS.speak("Press 1 to go to volume settings. Press 2 to go to visibility settings. Press 3 to disable text to speech. Press escape to go back")
	MenuSong.play(MainGlobals.menusongpos)
	if GodotTTS.ttsEnabled:
		$TTS/RichTextLabel3.text = "Disable Text to Speech (3)"
	else:
		$TTS/RichTextLabel3.text = "Enable Text  to Speech (3)"
func _process(delta):
	MainGlobals.menusongpos = MenuSong.get_playback_position()

func _input(event):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene("res://UI/MainMenu.tscn")
	if Input.is_action_just_pressed("first"):
		get_tree().change_scene("res://UI/mainscreensound.tscn")
	if Input.is_action_just_pressed("second"):
		get_tree().change_scene("res://UI/mainscreenvisibility.tscn")
	if Input.is_action_just_pressed("third"):
		if GodotTTS.ttsEnabled:
			GodotTTS.speak("")
			GodotTTS.ttsEnabled = false
			$TTS/RichTextLabel3.text = "Enable Text  to Speech (3)"
		else:
			GodotTTS.ttsEnabled = true
			$TTS/RichTextLabel3.text = "Disable Text to Speech (3)"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Volume_pressed():
	get_tree().change_scene("res://UI/mainscreensound.tscn")


func _on_Back_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")


func _on_Display_pressed():
	get_tree().change_scene("res://UI/mainscreenvisibility.tscn")


func _on_TTS_pressed():
	if GodotTTS.ttsEnabled:
		GodotTTS.speak("")
		GodotTTS.ttsEnabled = false
		$TTS/RichTextLabel3.text = "Enable Text  to Speech (3)"
	else:
		GodotTTS.ttsEnabled = true
		$TTS/RichTextLabel3.text = "Disable Text to Speech (3)"
