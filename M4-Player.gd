extends KinematicBody2D

# Declare member variables here. Examples:
var velocity = Vector2()
var speed = 130
var gravity = 25
var floo = Vector2(0, -1)
var jump = -750
var move = false
var walk = false
var direction = 1

signal hit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		velocity = move_and_slide(velocity, floo)
		#right arrow key pressed
		#gravity
		velocity.y += gravity
		#up arrow key pressed
		if (is_on_floor() && Input.is_action_pressed("ui_up") && walk == false):
			velocity.y += jump
		if (move == true):
			position += Vector2.RIGHT * 100 * delta
		if (velocity.y < -15 && !is_on_floor() && walk == false):
			$AnimatedSprite.play("jump")
		elif (is_on_floor() && walk == false):
			$AnimatedSprite.play("move")
		
		if get_slide_count() > 0:
			for i in get_slide_count():
				if "m4enemyrev" in get_slide_collision(i).collider.name:
					_dead()
		
		if get_position().y > 1000:
			get_tree().reload_current_scene()
			
		if get_slide_count() > 0:
			for i in get_slide_count():
				if "M4-Mayor" in get_slide_collision(i).collider.name:
					get_tree().change_scene("res://Areas/MainWorld.tscn")
		
		
func _dead():
	GodotTTS.speak("You got hit")
	emit_signal("hit")

#func _on_Timer_timeout():
	#get_tree().reload_current_scene()


func _on_Area2D_body_entered(body):
	print(body.name)
	if body.name == "M4-Enemy":
		GodotTTS.speak("Enemy approaching")


func _on_Area2D_area_entered(area):
	if area.name == "deadBody":
		GodotTTS.speak("Enemy approaching")
