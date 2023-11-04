extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$M4Game/Timer.start()

func _process(delta):
	$M4Game/UI/Timer.text = "Time Left: " + str(int($M4Game/Timer.time_left))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
