extends Control



func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS


	visible = true
	get_tree().paused = true



func _process(delta):
	if Input.is_action_just_pressed("first"):
		get_tree().paused = false
		visible = false


func _on_Start_pressed():
	get_tree().paused = false
	visible = false
