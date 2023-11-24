extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nTiles = 6
var dctMatches = {"Cause of the Revolutionary War": "The British placed heavy stamp, sugar, and tea taxes on the American Colonies",
	"President": "Chief of Military, nominates government officials, signs bills into law", 
	"1st Amendment": "Freedom of religion, speech, press, and assembly"
	}
var tile1 = "" #text of first selected tile
var tile2 = "" #text of secont selected tile
var dctAnsTile = {}
var bothTilesActive = false
var matched = false
var correct = 0
var wrong = 0
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
	$M3_matchButton.visible = false
	$M3_resetButton.visible = false
func receive_text(mtext):
	if not tile1:
		tile1 = mtext
	elif not tile2:
		tile2 = mtext
		bothTilesActive = true
		if(tile1 in dctMatches and dctMatches[tile1] == tile2) or (tile2 in dctMatches and dctMatches[tile2] == tile1): #merge with first cond and move into timout func tmrw
				matched = true
		#oncooldown = true
		#$Timer.start()
		$M3_matchButton.visible = true
		$M3_resetButton.visible = true
	print(mtext)
		
	#print(tile1)
	#print(tile2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func on_match():
	if(matched == true):
		get_node(str(dctAnsTile[tile1])).queue_free()
		get_node(str(dctAnsTile[tile2])).queue_free()
		tile1 = ""
		tile2 = ""
		correct += 1
	else:
		#print(tile1)
		#print(dctAnsTile[tile1])
		wrong += 1
		get_node(str(dctAnsTile[tile1])).get_node("Control/Disabled").visible = true
		get_node(str(dctAnsTile[tile1])).get_node("Control/Enabled").visible = false
		get_node(str(dctAnsTile[tile2])).get_node("Control/Disabled").visible = true
		get_node(str(dctAnsTile[tile2])).get_node("Control/Enabled").visible = false
		tile1 = ""
		tile2 = ""
	matched = false
	bothTilesActive = false
	
func on_reset():
	get_node(str(dctAnsTile[tile1])).get_node("Control/Disabled").visible = true
	get_node(str(dctAnsTile[tile1])).get_node("Control/Enabled").visible = false
	get_node(str(dctAnsTile[tile2])).get_node("Control/Disabled").visible = true
	get_node(str(dctAnsTile[tile2])).get_node("Control/Enabled").visible = false
	tile1 = ""
	tile2 = ""
	matched = false
	bothTilesActive = false
	 # Replace with function body.
