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

var playStart = true

var startTTSPlayed = false

func _input(event):
	if Input.is_action_pressed("cheatcourthouse"):
		MainGlobals.courthousewin = true
	if Input.is_action_pressed("cheatschool"):
		MainGlobals.schoolwin = true
	if Input.is_action_pressed("cheatpark"):
		MainGlobals.parkwin = true
	if Input.is_action_pressed("cheattownsquare"):
		MainGlobals.townsquarewin = true
