extends Node2D




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/Park/Park.tscn")


func _on_Town_Square__M4_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/M4 - Town Square/M4-Stage.tscn")
