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

#-------------------------------------------------------------------------------------

#example of using the SFX Manager in other scenes:
#var sfx_manager: SFXManager = preload("res://path/to/SFXManager.tscn").instance()

#func _ready():
	# Add the SFX Manager to the scene
	#add_child(sfx_manager)

	# Example: Play a sound effect named "sfx_1"
	#sfx_manager.play_sfx("sfx_1")

	# Example: Stop a sound effect named "sfx_2"
	#sfx_manager.stop_sfx("sfx_2")

	# Example: Stop all sound effects
	#sfx_manager.stop_all_sfx()
