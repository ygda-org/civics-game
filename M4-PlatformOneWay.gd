extends StaticBody2D

func _ready():
	get_node("platform-collision").set_deferred("disabled", true)

func _on_Area2D_body_entered(body):
	if body.name == "M4-Player":
		get_node("platform-collision").set_deferred("disabled", false)


func _on_Area2D_body_exited(body):
	if body.name == "M4-Player":
		get_node("platform-collision").set_deferred("disabled", true)
