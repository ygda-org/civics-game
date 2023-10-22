extends Area2D



const lines: Array = [
	"Hi There!",
	"Welcome to Jury Duty",
	
]


func _ready():
	pass


func _on_courthousenpc_body_entered(body):
	if body.name == "Player" and not DialogManager.is_dialog_active:
		DialogManager.start_dialog(get_global_position(), lines)
