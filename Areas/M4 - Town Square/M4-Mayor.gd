extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 120
# Called when the node enters the scene tree for the first time.
func _ready():
	$governor.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.LEFT * speed * delta
