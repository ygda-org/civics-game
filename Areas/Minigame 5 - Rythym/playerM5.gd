extends Area2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		# Handle the space key press, you can use another key or action as needed.
		checkSquareColor()
	
func checkSquareColor():
	var colliders = get_overlapping_bodies()
	for collider in colliders:
		if collider is WhiteSquare:
			# White square, give a point
			# You can implement a point system here.
			queue_free()
		elif collider is BlackSquare:
			# Black square, deduct a point
			# You can implement a point system here.
			queue_free()
