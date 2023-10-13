extends KinematicBody2D

# Declare member variables here. Examples:
var velocity = Vector2()
var speed = 64
var floo = Vector2(0, -1)
var direction = 1
var gravity = 5
var move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	velocity.y += gravity
	#wall bounce
	if is_on_wall() && move: 
		direction *= -1
	velocity.x = direction*speed
	
	if is_on_wall() || $RayCast2D.is_colliding() == false:
			direction *= -1
			$RayCast2D.position.x *= -1
	
	#movement
	""""
	if direction == 1 && move:
		$AnimatedSprite.play("default")
		$AnimatedSprite.flip_h = false
	elif direction == -1 && move:
		$AnimatedSprite.play("default")
		$AnimatedSprite.flip_h = true
	"""
	#player collide
	if get_slide_count() > 0:
		for i in get_slide_count():
			if "M4-Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider._dead()
				direction *= -1
	"""#disc collide
	if get_slide_count() > 0:
		for i in get_slide_count():
			if "Disc" in get_slide_collision(i).collider.name:
				_dead()
	"""
	velocity = move_and_slide(velocity, floo)
""""				
func _dead():
	$Timer.start()	
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	move = false
	direction = 0
	gravity = 0
	$CollisionShape2D.set_deferred("disabled", true)
	
func _on_Timer_timeout():
	queue_free()
"""
