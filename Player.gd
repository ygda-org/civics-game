extends KinematicBody2D

var speed = 7000
var velocity = Vector2.ZERO
var direction = 1

func get_input():
	if Input.is_action_pressed("topDownForward") or Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$AnimatedSprite.play("walkUp")
		direction = 1
	elif Input.is_action_pressed("topDownBackwards") or Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$AnimatedSprite.play("walkDown")
		direction = 2
	elif Input.is_action_pressed("topDownRight") or Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite.play("walkRight")
		direction = 3
	elif Input.is_action_pressed("topDownLeft")or Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite.play("walkLeft")
		direction = 4
	else:
			velocity = Vector2.ZERO
			if(direction == 1):
				$AnimatedSprite.play("idleUp")
			if(direction == 2):
				$AnimatedSprite.play("idleDown")
			if(direction == 3):
				$AnimatedSprite.play("idleRight")
			if(direction == 4):
				$AnimatedSprite.play("idleLeft")				
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	velocity = Vector2.ZERO
	get_input()
	velocity = move_and_slide(velocity*delta)

