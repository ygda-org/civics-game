extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dctMatches = {"b": "a", "c": "d"}
var tile1 = "" #text of first selected tile
var tile2 = "" #text of secont selected tile
var dctAnsTile = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	$match_tile.name = "match_tile1"
	var i = 1
	#get_node("match_tile1").get_node("Control/Label").text = "b"
	
	for key in dctMatches:
		print(key)
		get_node("match_tile" + str(i)).get_node("Control/Label").text = key 
		dctAnsTile[key] = "match_tile" + str(i)
		i +=1
		get_node("match_tile" + str(i)).get_node("Control/Label").text = dctMatches[key]
		dctAnsTile[dctMatches[key]] = "match_tile" + str(i)
		i +=1 
	#print(dctAnsTile)
func receive_text(mtext):
	if not tile1:
		tile1 = mtext
	elif not tile2:
		tile2 = mtext
		if(tile1 in dctMatches):
			if(dctMatches[tile1] == tile2):
				get_node(str(dctAnsTile[tile1])).queue_free()
				get_node(str(dctAnsTile[tile2])).queue_free()
		if(tile2 in dctMatches):
			if(dctMatches[tile2] == tile1):
				get_node(str(dctAnsTile[tile1])).queue_free()
				get_node(str(dctAnsTile[tile2])).queue_free()
		tile1 = ""
		tile2 = ""
	#print(tile1)
	#print(tile2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
