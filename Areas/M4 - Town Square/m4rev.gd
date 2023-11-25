extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemy = preload("res://Areas/M4 - Town Square/m4enemyrev.tscn")
var house = preload("res://Areas/M4 - Town Square/M4-House.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	$m4revgame/Timer.start()

func _process(delta):
	$m4revgame/CanvasLayer/Timer.text = "Time Left: " + str(int($m4revgame/Timer.time_left))
	$m4revgame/CanvasLayer/Score.text = "Score: " + str(M4Globals.score)
	if($m4revgame/Timer.time_left < 8 && $m4revgame/Timer.time_left > 3):
		find_node("backgroundm4").bgspeed = 120
		find_node("M4-Player").walk = true
		find_node("M4-Player").find_node("AnimatedSprite").play("walk")
	if($m4revgame/Timer.time_left < 3):
		find_node("backgroundm4").bgspeed = 0
		find_node("M4-Mayor").speed = 0
		find_node("M4-Player").move = true
		M4Globals.get2mayor = true

func _on_scoreTimer_timeout():
	M4Globals.score+=1

func _on_M4Player_hit():
	#make this depend on a certain threshold M4Globals.win = true
	$m4revgame/Timer.stop()
	$m4revgame/scoreTimer.stop()
	get_tree().change_scene("res://Areas/M4 - Town Square/m4endmenu.tscn")


func _on_Timer_timeout():
	#M4Globals.win = true
	$m4revgame/Timer.stop()
	$m4revgame/scoreTimer.stop()
	get_tree().change_scene("res://Areas/M4 - Town Square/m4endmenu.tscn")


func _on_enemytimer_timeout():
	var enemyspawn = enemy.instance()
	enemyspawn.scale = Vector2(3, 3)
	enemyspawn.position = Vector2(1027, 481)
	if($m4revgame/Timer.time_left > 13):
		add_child(enemyspawn)

func _on_mayortimer_timeout():
	find_node("M4-Mayor").position = Vector2(1090, 450)


func _on_housetimer_timeout():
	var housespawn = house.instance()
	housespawn.scale = Vector2(6, 6)
	housespawn.position = Vector2(1131+100, 414)
	housespawn.z_index = -5
	if($m4revgame/Timer.time_left > 13):
		add_child(housespawn)
