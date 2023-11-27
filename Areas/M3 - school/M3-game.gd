extends Node2D


var nTiles = 6
var masterLst = [
	{"Cause of the Revolutionary War": "The British placed heavy stamp, sugar, and tea taxes on the American Colonies",
	"President": "Chief of Military, nominates government officials, signs bills into law", 
	"1st Amendment": "Freedom of religion, speech, press, and assembly"
	},
	{ "15th & 19th  Amendment" : "Right to vote regardless of race or gender",
	"Legislative Branch/Congress": "Composed of the House of Representatives and the Senate, they create laws about military and commerce.",
	"House of Representatives" :"Number of representatives is dependent on their state’s population; members are elected by the people and serve for 2 years."
	},
	{"Senate" : "Each state gets 2 representatives; members are elected by the House and serve for 6 years.",
	"Judicial Branch": "Helps interpret and carry out laws. Courthouses fall under this category.",
	"Revolutionary War": "Began with the Battle of Lexington and Concord, where the American colonies won their independence from Britain."
	},
	{"Civil War" : "Fought between the Confederacy, who were trying to split from America, and the Union, and ended with the abolishment of slavery.",
	"Washington D.C." : "The capital of the United States. Home to buildings such as the White House, the Jefferson Memorial, and the Washington Monument.",
	"Great Depression": "Era in the 1920’s where unemployment skyrocketed after the stock market crash."
	}
	]
var roundNum = 0
var dctMatches = {}
var tile1 = "" #text of first selected tile
var tile2 = "" #text of secont selected tile
var dctAnsTile = {}
var bothTilesActive = false
var zoomed = false
var matched = false
var correct = 0
var wrong = 0

var inplay = true

# Called when the node enters the scene tree for the first time.
func _ready():
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	randomize()
	$match_tile.name = "match_tile1"
	$M3_zoom.visible = false
	getNewRound()
	$M3_matchButton.visible = false
	$M3_resetButton.visible = false
	

func _process(delta):
	$CanvasLayer/round.text = "Round: " + str(roundNum+1)

func receive_text(mtext):
	GodotTTS.speak(mtext)
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
	zoom(mtext)
	#print("yes")
		
	#print(tile1)
	#print(tile2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func zoom(mtext):
	#print("hi")
	$M3_zoom.visible = true
	$M3_zoom.active = true
	$M3_zoom/Label.text = mtext
	zoomed = true

func on_match():
	if(matched == true):
		get_node(str(dctAnsTile[tile1])).visible = false
		get_node(str(dctAnsTile[tile2])).visible = false
		get_node(str(dctAnsTile[tile1])).get_node("Control/Disabled").visible = true
		get_node(str(dctAnsTile[tile1])).get_node("Control/Enabled").visible = false
		get_node(str(dctAnsTile[tile2])).get_node("Control/Disabled").visible = true
		get_node(str(dctAnsTile[tile2])).get_node("Control/Enabled").visible = false
		tile1 = ""
		tile2 = ""
		correct += 1
		GodotTTS.speak("You matched correctly")
		if(correct%3 == 0):
			roundNum += 1
			getNewRound()
	else:
		#print(tile1)
		#print(dctAnsTile[tile1])
		wrong += 1
		GodotTTS.speak("You matched wrong")
		get_node(str(dctAnsTile[tile1])).get_node("Control/Disabled").visible = true
		get_node(str(dctAnsTile[tile1])).get_node("Control/Enabled").visible = false
		get_node(str(dctAnsTile[tile2])).get_node("Control/Disabled").visible = true
		get_node(str(dctAnsTile[tile2])).get_node("Control/Enabled").visible = false
		tile1 = ""
		tile2 = ""
	matched = false
	bothTilesActive = false
	#$M3_matchButton.visible = false
	#$M3_resetButton.visible = false
	
func on_reset():
	print(tile1)
	get_node(str(dctAnsTile[tile1])).get_node("Control/Disabled").visible = true
	get_node(str(dctAnsTile[tile1])).get_node("Control/Enabled").visible = false
	get_node(str(dctAnsTile[tile2])).get_node("Control/Disabled").visible = true
	get_node(str(dctAnsTile[tile2])).get_node("Control/Enabled").visible = false
	tile1 = ""
	tile2 = ""
	matched = false
	bothTilesActive = false
	#$M3_matchButton.visible = false
	#$M3_resetButton.visible = false
	 # Replace with function body.

func getNewRound():
	if(roundNum >= len(masterLst)): 
		get_tree().change_scene("res://Areas/M3 - school/m3endmenu.tscn")
	else:
		dctMatches = masterLst[roundNum]
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
			get_node("match_tile" + str(randOrder[i])).visible = true
			dctAnsTile[key] = "match_tile" + str(randOrder[i])
			i +=1
			get_node("match_tile" + str(randOrder[i])).visible = true
			get_node("match_tile" + str(randOrder[i])).get_node("Control/Label").text = dctMatches[key]
			dctAnsTile[dctMatches[key]] = "match_tile" + str(randOrder[i])
			i +=1 
	#print(dctAnsTile)



