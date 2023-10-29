extends Area2D

var already_talked = false
const SPEED = 50

const lines: Array = [
	"Hi There!",
]
#	"Welcome to Jury Duty",
#	"Can you help us with this case?",
#	"Get the details at the document table",
#	"Then make your verdict and come back to us"
#]




func _ready():
	pass


func _on_courthousenpc_body_entered(body):
	if body.name == "Player" and not DialogManager.is_dialog_active and not already_talked:
		DialogManager.start_dialog(get_global_position(), lines)
		already_talked = true
		

func _process(delta):
	if (not DialogManager.is_dialog_active && position.x < 350 && already_talked == true):
		position.x += delta * SPEED

