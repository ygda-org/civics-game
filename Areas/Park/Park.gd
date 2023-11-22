extends Node2D

var trashStarted = false
var score = 0



func _ready():
	trashStarted = false


func _process(delta):
		
	if trashStarted:
		$TrashGame/UI/Time.text = "Time Left: " + str(int($TrashGame/Timer.time_left))

func startTrash():
	randomize()
	$TrashGame/Timer.start()
	var r = randi()%10
	for i in range(r):
		var waste = preload("res://Areas/Park/Trash.tscn")
		add_child(waste.instance())
	for i in range(10-r):
		var recycle = preload("res://Areas/Park/Recycle.tscn")
		add_child(recycle.instance())
	trashStarted = true
	
func changeScore(newScore):
	score = newScore
	$TrashGame/UI/Score.text = "Score: " + str(score)
	


func _on_StartTrash_body_entered(body):
	if body.name == "Player":
		startTrash()
