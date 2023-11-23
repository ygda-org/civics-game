extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var nHouse = 3 #this one doesnt change
var nSelHouse = 3 #this is temp
var array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$M4Game/Timer.start()
	for house in get_node("Houses").get_children():
		house.get_node("houseparticle").visible = false
		house.get_node("AnimatedSprite").play("default")
		array.append(house)
	_randhouse()

func _process(delta):
	$M4Game/UI/Timer.text = "Time Left: " + str(int($M4Game/Timer.time_left))
	find_node("Score").text = "Score: " + str(score)
#	if _checkdefault() == false:
#		_randhouse()
#help
func _randhouse():
	#print("it happen")
	randomize()
	var rands = []
	for n in range(0, nHouse):
		rands.append(randi() % array.size())
	var changed = {}
	for rand in rands:
		changed[rand] = 0
		array[rand].get_node("houseparticle").visible = true
		array[rand].get_node("AnimatedSprite").play("selected")
	nSelHouse = len(changed)
	
	

func _checkdefault():
	for house in get_node("Houses").get_children():
		if house.get_node("AnimatedSprite").get_animation() == "selected":
			return false
	return true
	# supposed to return false if not all the houses are default frame but it keeps changing help


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
