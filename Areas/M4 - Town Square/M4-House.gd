extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var speed = get_parent().get_node("backgroundm4").bgspeed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.LEFT * speed * delta
