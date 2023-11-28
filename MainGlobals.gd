extends Node

var spawnPos = Vector2(188, 566)
var indicatorSpawn = Vector2(74,114)

var brightness = 1
var contrast = 1
var saturation = 1

var firstplay = true
var menusongpos = 0

var schoolwin = false
var parkwin = false
var townsquarewin = false
var courthousewin = false

var firsttimewin = true
var playersprinting = false
var playStart = true

var startTTSPlayed = false

func _input(event):
	if Input.is_action_just_pressed("cheatcourthouse") && !MainGlobals.courthousewin:
		courthousewin = true
	elif Input.is_action_just_pressed("cheatcourthouse") && MainGlobals.courthousewin:
		courthousewin = false
	if Input.is_action_just_pressed("cheatschool") && !MainGlobals.schoolwin:
		schoolwin = true
	elif Input.is_action_just_pressed("cheatschool") && MainGlobals.schoolwin:
		schoolwin = false
	if Input.is_action_just_pressed("cheattownsquare") && !MainGlobals.townsquarewin:
		townsquarewin = true
	elif Input.is_action_just_pressed("cheattownsquare") && MainGlobals.townsquarewin:
		townsquarewin = false
	if Input.is_action_just_pressed("cheatpark") && !MainGlobals.parkwin:
		parkwin = true
	elif Input.is_action_just_pressed("cheatpark") && MainGlobals.parkwin:
		parkwin = false
