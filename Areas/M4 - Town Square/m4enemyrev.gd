extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var speed = get_parent().get_node("backgroundm4").bgspeed

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.LEFT * speed * delta


func _on_pointAddBody_body_entered(body):
	if body.is_in_group("m4-player"):
		M4Globals.score += 10


func _on_m4enemyrev_body_entered(body):
	if body.is_in_group("m4-player"):
		body._dead()


func _on_deadBody_body_entered(body):
	if body.is_in_group("m4-player"):
		body._dead()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
