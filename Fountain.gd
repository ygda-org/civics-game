extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inreach = false
var willhappen
export var LINES = ""
var dialogue_happened = false
var player_body

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if inreach:
		$Control.visible = true
	else:
		$Control.visible = false
	if (willhappen and DialogManager.is_dialog_active and Input.is_action_pressed("interact")):
		dialogue_happened = true
		player_body.freeze(true)
	if (not DialogManager.is_dialog_active and dialogue_happened == true):
		inreach = false
		willhappen = false
		dialogue_happened = false
		player_body.freeze(false)

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		#print("in")
		body.z_index = z_index-1 # Replace with function body.


func _on_Area2D_body_exited(body):
	if "Player" in body.name:
		#print("in")
		body.z_index = z_index+1 # Replace with function body.


func _on_Dialogue_body_entered(body):
	$Control.visible = true
	inreach = true
	if (body.name == "Player" and not DialogManager.is_dialog_active):
		player_body = body
		willhappen = true
		DialogManager.start_dialog(position, LINES.split("*"))

func _on_Dialogue_body_exited(body):
	$Control.visible = false
	inreach = false
	willhappen = false
