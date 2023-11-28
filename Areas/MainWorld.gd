extends Node2D


func _ready():
	MenuSong.stop()
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	$Player.position = MainGlobals.spawnPos
	$CanvasLayer/PlayerIndicator.position = MainGlobals.indicatorSpawn
	if MainGlobals.playStart:

		var lines = [
		"Welcome to the town of Liberty Landing! (Press E to continue)",
		"Use the ARROW KEYS to move, 'SHIFT' to sprint, and 'E' to interact.",
		"Throughout the town there are sparkling minigames for you to play. Fulfill your duties and responsibilities as a citizen!",
		"Meet the residents to learn more about civics. Have fun!"]
		DialogManager.bypass = true
		DialogManager.start_dialog(position, lines)
		Input.action_press("interact")
		yield(get_tree().create_timer(0.1), "timeout")
		MenuSong.stop()
		$Player.freeze(true)
		MainGlobals.playStart = false

func _process(delta):
	if not DialogManager.is_dialog_active and not MainGlobals.playStart:
		$Player.freeze(false)
		MainGlobals.playStart = false
		MenuSong.stop()

	if MainGlobals.schoolwin && MainGlobals.parkwin && MainGlobals.townsquarewin && MainGlobals.courthousewin && MainGlobals.firsttimewin:
		get_tree().change_scene("res://UI/end credits.tscn")
		MainGlobals.firsttimewin = false
	if OS.has_feature("JavaScript"):
			$CanvasLayer/PlayerIndicator.position += $Player.get_velo()*0.000522792792791
	else:
		$CanvasLayer/PlayerIndicator.position += $Player.get_velo()*0.000280126126124


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
	if body.name == "Player":
		get_tree().change_scene("res://Areas/M3 - school/M3-game.tscn")
		MainGlobals.spawnPos = Vector2(-739, 331)
		MainGlobals.indicatorSpawn = Vector2(30, 98)


func _on_Courthouse_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/Courthouse_V2/Courthouse2.tscn") 
		MainGlobals.spawnPos = Vector2(208, -1390)
		MainGlobals.indicatorSpawn = Vector2(74,14)




func _on_pause_pressed():
	pass # Replace with function body.
