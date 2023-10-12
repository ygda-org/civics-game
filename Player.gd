extends KinematicBody2D

var speed = 200
var velocity = Vector2.ZERO

func get_input():
	if Input.is_action_pressed("topDownForward"):
		velocity.y -= 1
	elif Input.is_action_pressed("topDownBackwards"):
		velocity.y += 1
	elif Input.is_action_pressed("topDownRight"):
		velocity.x += 1
	elif Input.is_action_pressed("topDownLeft"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	velocity = Vector2.ZERO
	get_input()
	velocity = move_and_slide(velocity)
