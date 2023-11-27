extends Node2D


func _ready():
	MenuSong.stop()
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	$Player.position = MainGlobals.spawnPos
	$CanvasLayer/PlayerIndicator.position = MainGlobals.indicatorSpawn
	GodotTTS.speak("welcome to liberty landing!")
func _input(event):
	if Input.is_action_pressed("cheatcode"):
		MainGlobals.schoolwin = true
		MainGlobals.parkwin = true
		MainGlobals.townsquarewin = true
		MainGlobals.courthousewin = true

func _process(delta):
	if MainGlobals.schoolwin && MainGlobals.parkwin && MainGlobals.townsquarewin && MainGlobals.courthousewin && MainGlobals.firsttimewin:
		get_tree().change_scene("res://UI/end credits.tscn")
		MainGlobals.firsttimewin = false
	if OS.has_feature("JavaScript"):
			$CanvasLayer/PlayerIndicator.position += $Player.get_velo()*0.00060322245322
	else:
		$CanvasLayer/PlayerIndicator.position += $Player.get_velo()*0.00032322245322

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/Park/Park.tscn")
		MainGlobals.spawnPos = Vector2(1300, 220)
		MainGlobals.indicatorSpawn = Vector2(128,98)



func _on_Town_Square__M4_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/M4 - Town Square/m4rev.tscn")
		MainGlobals.spawnPos = Vector2(470, -880)
		MainGlobals.indicatorSpawn = Vector2(90,40)


func _on_School_body_entered(body):
	pass # Replace with function body.


func _on_Courthouse_body_entered(body):
	pass # Replace with function body.
	
