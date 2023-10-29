extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	"""
	var nodes = get_tree().get_nodes_in_group("Road_asset")
	for node in nodes:
		node.z_index = node.position.y
"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
