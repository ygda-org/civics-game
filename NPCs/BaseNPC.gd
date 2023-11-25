extends Node2D

export var LINES = ""
var dialogue_happened = false
var player_body
var inreach = false
var willhappen

func _ready():
	z_index = 3

func _process(delta):
	if inreach:
		$Control.visible = true
	else:
		$Control.visible = false
	if (inreach and willhappen and DialogManager.is_dialog_active and Input.is_action_pressed("interact")):
		dialogue_happened = true
		player_body.freeze(true)
	if (not DialogManager.is_dialog_active and dialogue_happened == true):
		inreach = false
		willhappen = false
		dialogue_happened = false
		player_body.freeze(false)

func _on_Area2D_body_entered(body):
	$Control.visible = true
	inreach = true
	if (body.name == "Player" and not DialogManager.is_dialog_active):
		player_body = body
		willhappen = true
		DialogManager.start_dialog(position, LINES.split("*"))

func _on_Gremlin_Area_body_entered(body):
	if "Player" in body.name:
		body.behindCount += 1
		if(body.z_index > z_index -1):
			body.z_index = z_index -1 # Replace with function body.
		print(body.z_index)

func _on_Gremlin_Area_body_exited(body):
	if "Player" in body.name:
		print("out")
		body.behindCount -= 1
		if(body.behindCount == 0):
			body.z_index = z_index + 1

		

func _on_Area2D_body_exited(body):
	$Control.visible = false
	inreach = false
	willhappen = false
	DialogManager.end_dialog()
