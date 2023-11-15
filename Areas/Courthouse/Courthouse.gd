extends Node2D

var guilty = false

func _ready():
	$"guilty-button".connect("toggle_guilty", self, "change_verdict")


func _on_court_to_main_area_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/MainWorld.tscn")
		## SET PLAYER POSITION TO THAT OF WHEN COURTHOUSE ENTERED

func change_verdict():
	guilty = not guilty
	$"courthouse-npc2".guilty = guilty
