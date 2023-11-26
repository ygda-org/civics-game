extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inrange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false # Replace with function body.
	$Label.text = "E"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inrange and Input.is_action_just_pressed("interact"):
		get_parent().get_node("docTableOpen").visible = true
		get_parent().get_node("Player").frozen = true



func _on_docTable_body_entered(body):
	if("Player" in body.name):
		inrange = true # Replace with function body.
		$Label.visible = true


func _on_docTable_body_exited(body):
	if("Player in body.name"):
		inrange = false # Replace with function body.
		$Label.visible = false
