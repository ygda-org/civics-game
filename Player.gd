extends KinematicBody2D

var speed = 7000
var velocity = Vector2.ZERO
var direction = 1
var frozen = false
var is_sprinting = false

func get_velo():
	return velocity

func get_input():
	var sprint_multiplier = 1.0
	$AnimatedSprite.speed_scale = sprint_multiplier

	if Input.is_action_pressed("sprint"):
		sprint_multiplier = 1.3
		$AnimatedSprite.speed_scale = sprint_multiplier
		is_sprinting = true
	else:
		is_sprinting = false
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
		if not is_sprinting:
			$AnimatedSprite.play("walkRight")
		else:
			$AnimatedSprite.play("sprintRight")
		direction = 3
	elif Input.is_action_pressed("topDownLeft") or Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		if is_sprinting:
			$AnimatedSprite.play("sprintLeft")
		else:
			$AnimatedSprite.play("walkLeft")
		direction = 4
	else:
		velocity = Vector2.ZERO
		if direction == 1:
			$AnimatedSprite.play("idleUp")
		elif direction == 2:
			$AnimatedSprite.play("idleDown")
		elif direction == 3:
			$AnimatedSprite.play("idleRight")
		elif direction == 4:
			$AnimatedSprite.play("idleLeft")

	velocity = velocity.normalized() * speed * sprint_multiplier

func _physics_process(delta):
	velocity = Vector2.ZERO
	if (not frozen):
		get_input()
	if (frozen):	
		$AnimatedSprite.stop()
	velocity = move_and_slide(velocity*delta)

func freeze(f):
	frozen = f
