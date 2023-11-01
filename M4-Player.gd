extends KinematicBody2D

# Declare member variables here. Examples:
var velocity = Vector2()
var speed = 130
var gravity = 10
var floo = Vector2(0, -1)
var jump = -250
var move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
		velocity = move_and_slide(velocity, floo)
		#right arrow key pressed
		if (Input.is_action_pressed("ui_right") && move):
			velocity.x = speed
			"""if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1"""
		#left arrow key pressed
		elif (Input.is_action_pressed("ui_left") && move):
			velocity.x = -speed
			"""if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1"""
		#none	
		elif move:
			velocity.x = 0
		#gravity
		velocity.y += gravity
		#up arrow key pressed
		if (is_on_floor() && Input.is_action_pressed("ui_up")):
			velocity.y += jump
		
		if get_slide_count() > 0:
			for i in get_slide_count():
				if "M4-Enemy" in get_slide_collision(i).collider.name:
					print("DIE")
					_dead()
		
		if get_position().y > 1000:
			get_tree().reload_current_scene()
			
		if get_slide_count() > 0:
			for i in get_slide_count():
				if "M4-Mayor" in get_slide_collision(i).collider.name:
					print("yay ")
					get_tree().change_scene("res://Areas/MainWorld.tscn")
		
		
func _dead():
	#$Timer.start()	
	
	#move = false
	"""
	gravity = 0
	speed = 0
	jump = 0
	velocity = Vector2(0,0)
	"""
	#$AnimatedSprite.play("dead")
	move = false;
	$PlayerCollision.set_deferred("disabled", true)

#func _on_Timer_timeout():
	#get_tree().reload_current_scene()
