extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nTiles = 4
var dctMatches = {"b": "a", "c": "d"}
var tile1 = "" #text of first selected tile
var tile2 = "" #text of secont selected tile
var dctAnsTile = {}
var oncooldown = false
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$match_tile.name = "match_tile1"
	var i = 0
	#get_node("match_tile1").get_node("Control/Label").text = "b"
	var randOrder = []
	while len(randOrder) < nTiles:
		var rand = int(randf() * nTiles) + 1
		if not rand in randOrder:
			randOrder.append(rand)
	
	print(randOrder)		
	
	for key in dctMatches:
		get_node("match_tile" + str(randOrder[i])).get_node("Control/Label").text = key 
		dctAnsTile[key] = "match_tile" + str(randOrder[i])
		i +=1
		get_node("match_tile" + str(randOrder[i])).get_node("Control/Label").text = dctMatches[key]
		dctAnsTile[dctMatches[key]] = "match_tile" + str(randOrder[i])
		i +=1 
	#print(dctAnsTile)
	
func receive_text(mtext):
	if not oncooldown:
		if not tile1:
			tile1 = mtext
		elif not tile2:
			tile2 = mtext
			if(tile1 in dctMatches and dctMatches[tile1] == tile2): 
					get_node(str(dctAnsTile[tile1])).queue_free()
					get_node(str(dctAnsTile[tile2])).queue_free()
					tile1 = ""
					tile2 = ""
			elif(tile2 in dctMatches and dctMatches[tile2] == tile1): #merge with first cond and move into timout func tmrw
					get_node(str(dctAnsTile[tile1])).queue_free()
					get_node(str(dctAnsTile[tile2])).queue_free()
					tile1 = ""
					tile2 = ""
			else:
				oncooldown = true
				$Timer.start()
			
	#print(tile1)
	#print(tile2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	oncooldown = false
	print(tile1)
	print(dctAnsTile[tile1])
	get_node(str(dctAnsTile[tile1])).get_node("Control/Label").visible = false
	get_node(str(dctAnsTile[tile2])).get_node("Control/Label").visible = false
	tile1 = ""
	tile2 = ""
	 # Replace with function body.
