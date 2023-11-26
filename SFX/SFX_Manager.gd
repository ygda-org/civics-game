#SFX Manager!!!!!

extends Node2D

# Play a specific sound effect
func play_sfx(sfx_name: String):
	var sfx_node = get_node(sfx_name)
	if sfx_node:
		sfx_node.play()

# Stop a specific sound effect
func stop_sfx(sfx_name: String):
	var sfx_node = get_node(sfx_name)
	if sfx_node:
		sfx_node.stop()

# Stop all sound effects
func stop_all_sfx():
	for child in get_children():
		if child is AudioStreamPlayer:
			child.stop()

# Check if a specific sound effect is currently playing
func is_sfx_playing(sfx_name: String) -> bool:
	var sfx_node = get_node(sfx_name)
	return sfx_node and sfx_node.playing

# Check if any sound effect is currently playing
func is_any_sfx_playing() -> bool:
	for child in get_children():
		if child is AudioStreamPlayer and child.playing:
			return true
	return false

#-------------------------------------------------------------------------------------

#example of using the SFX Manager in other scenes:

#var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
#var sfx_manager

#func _ready():
	#sfx_manager = sfx_manager_scene.instance()
	#add_child(sfx_manager)

# Example: Play a sound effect named "sfx_1"
#sfx_manager.play_sfx("sfx_1")

# Example: Stop a sound effect named "sfx_2"
#sfx_manager.stop_sfx("sfx_2")

# Example: Stop all sound effects
#sfx_manager.stop_all_sfx()
