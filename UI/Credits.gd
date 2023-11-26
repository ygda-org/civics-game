extends Control


func _on_Back_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")

func _input(event):
	if Input.is_action_pressed("pause"):
		get_tree().change_scene("res://UI/MainMenu.tscn")
