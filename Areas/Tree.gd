extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayerInBack_body_entered(body):
	if "Player" in body.name:
		#print("in")
		body.behindCount += 1
		body.z_index = z_index -1


func _on_PlayerInBack_body_exited(body):
	if "Player" in body.name:
		#print("out")
		body.behindCount -= 1
		if(body.behindCount == 0):
			body.z_index = z_index + 1

