extends Area2D


func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var spawnX = random.randf_range(25, 900)
	var spawnY = random.randf_range(120-185, 500-185)

	set_position(Vector2(spawnX, spawnY))


func _on_Trash_area_entered(area):
	if area.name == "PlayerArea":
		pass
		
func die():
	queue_free()
