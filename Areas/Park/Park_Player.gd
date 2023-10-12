extends KinematicBody2D

var speed = 15000
var velocity = Vector2.ZERO
var score = 0
var recycleHand = 0
var wasteHand = 0

func get_input():
	if Input.is_action_pressed("topDownForward"):
		velocity.y -= 1
	elif Input.is_action_pressed("topDownBackwards"):
		velocity.y += 1
	elif Input.is_action_pressed("topDownRight"):
		velocity.x += 1
	elif Input.is_action_pressed("topDownLeft"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	velocity = Vector2.ZERO
	get_input()
	velocity = move_and_slide(velocity*delta)


func _on_Area2D_area_entered(area):
	print(area.name)
	if "Trash" in area.name and area.is_in_group("trash") and recycleHand == 0:
		wasteHand += 1
		area.die()
	elif "Recycle" in area.name and area.is_in_group('trash') and wasteHand == 0:
		recycleHand += 1
		area.die()



func _on_PlayerArea_body_entered(body):
	if body.name == "Trashcan":
		score += wasteHand
		get_parent().changeScore(score)
		wasteHand = 0
	elif body.name == "RecyclingCan":
		score += recycleHand
		get_parent().changeScore(score)
		recycleHand = 0

