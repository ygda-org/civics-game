extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_node("House1 Sprite").z_index)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayerInBack_body_entered(body):
	if "Player" in body.name:
		#print("in")
		body.z_index = z_index-1 # Replace with function body.


func _on_PlayerInBack_body_exited(body):
	if "Player" in body.name:
		#print("out")
		body.z_index = z_index + 1
