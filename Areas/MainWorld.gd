extends Node2D

func _ready():
	$Player.position = MainGlobals.spawnPos
	$CanvasLayer/PlayerIndicator.position = MainGlobals.indicatorSpawn

func _process(delta):
	$CanvasLayer/PlayerIndicator.position += $Player.get_velo()*0.00032322245322

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/Park/Park.tscn")
		MainGlobals.spawnPos = Vector2(1300, 220)
		MainGlobals.indicatorSpawn = Vector2(128,98)



func _on_Town_Square__M4_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Areas/M4 - Town Square/M4-Stage.tscn")
		MainGlobals.spawnPos = Vector2(470, -880)
		MainGlobals.indicatorSpawn = Vector2(90,40)


func _on_School_body_entered(body):
	pass # Replace with function body.


func _on_Courthouse_body_entered(body):
	pass # Replace with function body.
	
