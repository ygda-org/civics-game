extends Node2D

export var LINES2 = ""
var dialogue_happened = false
var player_body
var interacted

func _ready():
	pass	

func _process(delta):
	if (interacted and DialogManager.is_dialog_active and Input.is_action_pressed("interact")):
		dialogue_happened = true
		player_body.freeze(true)
	if (not DialogManager.is_dialog_active and dialogue_happened == true):
		dialogue_happened = false
		interacted = false
		player_body.freeze(false)

func _on_Area2D_body_entered(body):
	var pressed
	if (body.name == "Player" and not DialogManager.is_dialog_active):
		player_body = body
		interacted = true
		DialogManager.start_dialog(position, LINES2.split("*"))

func _on_Area2D_body_exited(body):
	pass # Replace with function body.

func _on_dialogue_body_entered(body):
	if "Player" in body.name:
		body.z_index = z_index-1


func _on_dialogue_body_exited(body):
	if "Player" in body.name:
		body.z_index = z_index+1
