extends Area2D

var verdict
var guilty = false
var entered = false

func _ready():
	pass

func _process(delta):
	if entered and Input.is_action_pressed("interact") and not DialogManager.is_dialog_active:
		if (guilty):
			verdict = "guilty"
		else:
			verdict = "innocent"
		DialogManager.start_dialog(get_global_position(), 
		["Prove the defendant is " + verdict])
		


func _on_courthousenpc2_body_entered(body):
	if body.name == "Player":
		entered = true

func _on_courthousenpc2_body_exited(body):
	if body.name == "Player":
		entered = false
