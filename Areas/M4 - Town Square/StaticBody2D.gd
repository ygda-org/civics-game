extends Area2D


var inreach = false


func _ready():
	get_parent().find_node("Control").visible = false

func _process(delta):
	if inreach == true && Input.is_action_just_pressed("interact"):
		inreach = false
		var stage = get_parent().get_parent().get_parent()
		stage.score += 1
		stage.nSelHouse -= 1
		get_parent().get_node("AnimatedSprite").play("default")
		get_parent().get_node("houseparticle").visible = false
		if(stage.nSelHouse == 0):
			stage._randhouse()



func _on_StaticBody2D_body_entered(body):
	if("M4-Player" in body.name && get_parent().get_node("AnimatedSprite").get_animation() == "selected"):# Replace with function body.
		get_parent().find_node("Control").visible = true
		inreach = true

func _on_StaticBody2D_body_exited(body):
	if("M4-Player" in body.name):
		get_parent().find_node("Control").visible = false
		inreach = false 
