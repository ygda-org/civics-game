extends KinematicBody2D
class_name BlackSquare

var speed = Vector2(-100, 0)

func _process(delta):
	move_and_collide(speed * delta)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
