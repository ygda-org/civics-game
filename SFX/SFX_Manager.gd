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
	return sfx_node.is_playing()

# Check if any sound effect is currently playing
func is_any_sfx_playing() -> bool:
	for child in get_children():
		if child is AudioStreamPlayer and child.is_playing():
			return true
	return false

#-------------------------------------------------------------------------------------

#example of using the SFX Manager in other scenes:

#if is_sprinting == true && !$SFX_Manager.is_sfx_playing("footsteps_hard_sprint"):
			#$SFX_Manager.stop_sfx("footsteps_hard_walk")
			#$SFX_Manager.play_sfx("footsteps_hard_sprint")
		#elif is_sprinting == false && !$SFX_Manager.is_sfx_playing("footsteps_hard_walk"):
			#$SFX_Manager.stop_sfx("footsteps_hard_sprint")
			#$SFX_Manager.play_sfx("footsteps_hard_walk")
