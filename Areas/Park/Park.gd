extends Node2D

var trashStarted = false
var score = 0

func _process(delta):
		
	if trashStarted:
		$TrashGame/UI/Time.text = "Time Left: " + str(int($TrashGame/Timer.time_left))

func _ready():
	trashStarted = true
	$TrashGame/UI/Score.text = "Score: " + str(score)
	var random = RandomNumberGenerator.new()
	random.randomize()
	$TrashGame/Timer.start()
	var r = random.randi_range(3,8)
	print(r)
	for i in range(r):
		var waste = preload("res://Areas/Park/Trash.tscn")
		var wasteinst = waste.instance()
		wasteinst.z_index = -1
		add_child(wasteinst)
	for i in range(10-r):
		var recycle = preload("res://Areas/Park/Recycle.tscn")
		var recycleinst = recycle.instance()
		recycleinst.z_index = -1
		add_child(recycleinst)
	trashStarted = true
	
func changeScore(newScore):
	score = newScore
	$TrashGame/UI/Score.text = "Score: " + str(score)
	if score == 10:
		ParkGlobals.isWin = true
		get_tree().change_scene("res://Areas/Park/ParkEndMenu.tscn")
	


func _on_Timer_timeout():
	if score == 10:
		ParkGlobals.isWin = true
	else:
		ParkGlobals.isWin = false
	ParkGlobals.score = score
	get_tree().change_scene("res://Areas/Park/ParkEndMenu.tscn")
