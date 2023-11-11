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
		var stage = get_parent().get_parent().get_parent()
		stage.score += 1
		stage.nSelHouse -= 1
		get_parent().get_node("AnimatedSprite").play("default")
		if(stage.nSelHouse == 0):
			stage._randhouse()
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
