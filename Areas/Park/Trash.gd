extends Area2D


func _ready():
	randomize()
	var spawnX = randf() * 1191
	var spawnY = randf() * -725

	set_position(Vector2(spawnX, spawnY))


func _on_Trash_area_entered(area):
	if area.name == "PlayerArea":
		pass
		
func die():
	queue_free()
