extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mvt = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if MainGlobals.firstplay == true:
		get_parent().find_node("intro").play()
	else:
		MenuSong.play(MainGlobals.menusongpos)
	$AnimatedSprite.play("default") # Replace with function body.

func playmvt():
	if get_parent().get_node("Control").startenabled:
		print("smth")
		get_parent().find_node("walkingtime").start()
		mvt = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	MainGlobals.menusongpos = MenuSong.get_playback_position()
	if mvt:
		$AnimatedSprite.speed_scale = 2.2
		position.y -= delta * 10
		scale.x /= 1.005
		scale.y /= 1.005


func _on_intro_finished():
	MainGlobals.firstplay = false
	MenuSong.play(MainGlobals.menusongpos)
