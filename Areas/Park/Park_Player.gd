extends KinematicBody2D

var speed = 13000
var velocity = Vector2.ZERO
var score = 0
var recycleHand = 0
var wasteHand = 0
var direction = 1
var typeWaste
var waste

var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()

func _ready():
	add_child(sfx_manager)

func get_input():

	if Input.is_action_pressed("topDownForward"):
		velocity.y = -1
		velocity.x = 0
		direction = 1
		$AnimatedSprite.play("upWalk")
	elif Input.is_action_pressed("topDownBackwards"):
		velocity.y = 1
		velocity.x = 0
		direction = 2
		$AnimatedSprite.play("downWalk")
	elif Input.is_action_pressed("topDownRight"):
		velocity.y = 0
		velocity.x = 1
		direction = 3
		$AnimatedSprite.play("rightWalk")
	elif Input.is_action_pressed("topDownLeft"):
		velocity.y = 0
		velocity.x = -1
		direction = 4
		$AnimatedSprite.play("leftWalk")
	elif(get_slide_count() > 0):
			if(direction == 1):
				$AnimatedSprite.play("upIdle")
			if(direction == 2):
				$AnimatedSprite.play("downIdle")
			if(direction == 3):
				$AnimatedSprite.play("rightIdle")
			if(direction == 4):
				$AnimatedSprite.play("leftIdle")
	velocity = velocity.normalized() * speed
	if Input.is_action_pressed("interact"):
		if typeWaste == "waste":
			if !sfx_manager.is_sfx_playing("park_trash_1"):
				sfx_manager.stop_sfx("park_trash_1")
				sfx_manager.play_sfx("park_trash_1")
			print(typeWaste)
			wasteHand += 1
			waste.die()
			waste = null
		elif typeWaste == "recycle":
			if !sfx_manager.is_sfx_playing("park_trash_4"):
				sfx_manager.stop_sfx("park_trash_4")
				sfx_manager.play_sfx("park_trash_4")
			recycleHand += 1
			waste.die()
			waste = null
		else:
			waste = null

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity*delta)


func _on_Area2D_area_entered(area):
	if "Trash" in area.name and area.is_in_group("trash") and recycleHand == 0:
		waste = area
		typeWaste = "waste"
	elif "Recycle" in area.name and area.is_in_group('trash') and wasteHand == 0:
		waste = area
		typeWaste = "recycle"


func _on_PlayerArea_area_exited(area):
	if "Trash" in area.name and area.is_in_group("trash") and recycleHand == 0:
		GodotTTS.speak("Trash")
		waste = null
		typeWaste = ""
	elif "Recycle" in area.name and area.is_in_group('trash') and wasteHand == 0:
		GodotTTS.speak("Recycling")
		waste = null
		typeWaste = ""


func _on_PlayerArea_body_entered(body):
	if body.name == "Trashcan":
		GodotTTS.speak("Collided with trash can")
		score += wasteHand
		get_parent().changeScore(score)
		wasteHand = 0
	elif body.name == "RecyclingCan":
		GodotTTS.speak("Collided with recycling can")
		score += recycleHand
		get_parent().changeScore(score)
		recycleHand = 0
	elif body.name == "Walls":
		GodotTTS.speak("Collided with wall")



