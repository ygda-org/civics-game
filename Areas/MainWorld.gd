extends Node2D


func _process(delta):
	$CanvasLayer/PlayerIndicator.position += $Player.get_velo()*0.00039322245322

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/Park/Park.tscn")


func _on_Town_Square__M4_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/M4 - Town Square/M4-Stage.tscn")


func _on_School_body_entered(body):
	pass # Replace with function body.


func _on_Courthouse_body_entered(body):
	pass # Replace with function body.
	
