extends Node2D

var trashStarted = false
var score = 0

var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()

func _process(delta):
		
	if trashStarted:
		$TrashGame/UI/Time.text = "Time Left: " + str(int($TrashGame/Timer.time_left))

func _ready():
	GodotTTS.speak("Park cleanup. pick up and sort litter into recyclables or trash before time runs out. Careful though, you can only hold one type of litter at a time. win stars based on your score. used w a s d keys to move and e to pick up litter. walk into a trash can or recycling bin to clear your litter and increase your score. press 1 to start.")
	add_child(sfx_manager)
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
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
	if !sfx_manager.is_sfx_playing("park_put_trash_in_bin"):
		sfx_manager.stop_sfx("park_put_trash_in_bin")
		sfx_manager.play_sfx("park_put_trash_in_bin")
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
