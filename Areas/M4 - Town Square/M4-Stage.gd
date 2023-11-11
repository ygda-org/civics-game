extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$M4Game/Timer.start()
	_randhouse()

func _process(delta):
	$M4Game/UI/Timer.text = "Time Left: " + str(int($M4Game/Timer.time_left))
	find_node("Score").text = "Score: " + str(score)
#	if _checkdefault() == false:
#		_randhouse()
#help
func _randhouse():
	var array = []
	for house in get_node("Houses").get_children():
		house.get_node("AnimatedSprite").play("default")
		array.append(house)
	randomize()
	array[randi() % array.size()].get_node("AnimatedSprite").play("selected")
	array[randi() % array.size()].get_node("AnimatedSprite").play("selected")
	array[randi() % array.size()].get_node("AnimatedSprite").play("selected")

func _checkdefault():
	for house in get_node("Houses").get_children():
		if house.get_node("AnimatedSprite").get_animation() == "selected":
			return false
	return true
	# supposed to return false if not all the houses are default frame but it keeps changing help


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
