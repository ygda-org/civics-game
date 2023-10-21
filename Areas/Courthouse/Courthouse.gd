extends Node2D

func _ready():
	pass


func _on_court_to_main_area_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/MainWorld.tscn")
		## SET PLAYER POSITION TO THAT OF WHEN COURTHOUSE ENTERED


