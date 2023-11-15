extends Area2D

var entered = false
var state = 0


func _ready():
	$AnimatedSprite.play("unpressed")
	state = 0


func _on_guiltybutton_body_entered(body):
	if (body.name == "Player"):
		entered = true

signal toggle_guilty()

func _process(delta):
	if (entered and Input.is_action_just_pressed("interact")):
		if state == 0:
			$AnimatedSprite.play("pressed")
			state = 1
		else:
			$AnimatedSprite.play("unpressed")
			state = 0
		emit_signal("toggle_guilty")
	


func _on_guiltybutton_body_exited(body):
	if body.name == "Player":
		entered = false
