extends Node2D

export var LINES = ""
var dialogue_happened = false
var player_body

func _ready():
	pass	

func _process(delta):
	if (DialogManager.is_dialog_active and Input.is_action_pressed("interact")):
		dialogue_happened = true
		player_body.freeze(true)
	if (not DialogManager.is_dialog_active and dialogue_happened == true):
		dialogue_happened = false
		player_body.freeze(false)

func _on_Area2D_body_entered(body):
	var pressed
	if (body.name == "Player" and not DialogManager.is_dialog_active):
		player_body = body
		DialogManager.start_dialog(position, LINES.split("*"))
