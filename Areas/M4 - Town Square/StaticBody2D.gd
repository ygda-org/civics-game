extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inreach = false
var ispressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().find_node("Control").visible = false

func _process(delta):
	if inreach == true && Input.is_action_just_pressed("advance_dialog"):
		inreach = false
		get_parent().get_parent().get_parent().score += 1
		get_parent().get_node("AnimatedSprite").play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StaticBody2D_body_entered(body):
	if("M4-Player" in body.name && get_parent().get_node("AnimatedSprite").get_animation() == "selected"):# Replace with function body.
		get_parent().find_node("Control").visible = true
		inreach = true

func _on_StaticBody2D_body_exited(body):
	if("M4-Player" in body.name):
		get_parent().find_node("Control").visible = false
		inreach = false # Replace with function body.
