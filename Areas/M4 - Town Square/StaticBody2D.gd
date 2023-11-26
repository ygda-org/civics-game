extends Area2D


var inreach = false
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.




# Called every frame. 'delta' is the elapsed time since the previous frame.


func _ready():
	rng.randomize()
	var num = rng.randi_range(1,2)
	print(num)
	if(int(num) == 1): 
		get_parent().get_node("AnimatedSprite").play("selected")
		get_parent().get_node("houseparticle").visible = true
	else:
		get_parent().get_node("AnimatedSprite").play("default")
		get_parent().get_node("houseparticle").visible = false
	get_parent().find_node("Control").visible = false
	
	
func _process(delta):
	if inreach == true && Input.is_action_just_pressed("interact"):
		inreach = false
		M4Globals.numhouses += 1
		M4Globals.score += 50
		get_parent().get_node("AnimatedSprite").play("default")
		get_parent().get_node("houseparticle").visible = false



func _on_StaticBody2D_body_entered(body):
	if("M4-Player" in body.name && get_parent().get_node("AnimatedSprite").get_animation() == "selected"):# Replace with function body.
		get_parent().find_node("Control").visible = true
		GodotTTS.speak("House")
		inreach = true

func _on_StaticBody2D_body_exited(body):
	if("M4-Player" in body.name):
		get_parent().find_node("Control").visible = false
		inreach = false 
