extends KinematicBody2D

# Declare member variables here. Examples:
var velocity = Vector2()
var speed = 130
var gravity = 10
var floo = Vector2(0, -1)
var jump = -250
var move = true
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
		velocity = move_and_slide(velocity, floo)
		#right arrow key pressed
		if Input.is_action_pressed("ui_left") && move:
			velocity.x = -speed
			$AnimatedSprite.play("move")
			$AnimatedSprite.flip_h = true
			direction = 0
		elif Input.is_action_pressed("ui_right") && move:
			velocity.x = speed
			$AnimatedSprite.play("move")
			$AnimatedSprite.flip_h = false
			direction = 1
		elif move:
			velocity.x = 0
			$AnimatedSprite.play("idle")
		#gravity
		velocity.y += gravity
		#up arrow key pressed
		if (is_on_floor() && Input.is_action_pressed("ui_up")):
			velocity.y += jump
		
		if velocity.y < -100:
			$AnimatedSprite.play("jump")
		#fall animation
		elif (velocity.y < 5 && ! is_on_floor()):
			$AnimatedSprite.play("fall")
		elif (velocity.y < 2 || ! is_on_floor()):
			$AnimatedSprite.play("move")
		
		if get_slide_count() > 0:
			for i in get_slide_count():
				if "M4-Enemy" in get_slide_collision(i).collider.name:
					_dead()
		
		if get_position().y > 1000:
			get_tree().reload_current_scene()
			
		if get_slide_count() > 0:
			for i in get_slide_count():
				if "M4-Mayor" in get_slide_collision(i).collider.name:
					get_tree().change_scene("res://Areas/MainWorld.tscn")
		
		
func _dead():
	move = false;
	$PlayerCollision.set_deferred("disabled", true)

#func _on_Timer_timeout():
	#get_tree().reload_current_scene()
