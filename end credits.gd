extends Node2D


var started = false
var ended = false
var frame = 1
var move = false
# Called when the node enters the scene tree for the first time.
func _ready():
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	$skipbutton.visible = false
	$credits/Skip.visible = false
	$mainmenu.visible = false
	$credits/mainmenu.visible = false
	$playermenu/AnimatedSprite.play("walk")
	$credits/reallines.get_child(0).modulate.a = 0

func _process(delta):
	if frame >= 5:
		end()
	if started:
		$skipbutton.visible = true
		$credits/Skip.visible = true
		$credits/reallines.get_child(0).value += 0.5
	if move:
		$polaroid.position.y -= delta * 200
func end():
	if not ended:
		ended = true
		$mainmenu.visible = true
		$credits/mainmenu.visible = true
		$credits/reallines.get_child(0).value = 10000
		$playermenu/AnimatedSprite.play("default")

func _input(event):
	if Input.is_action_pressed("skip") && started:
		end()
	if Input.is_action_pressed("pause") && ended:
		get_tree().change_scene("res://UI/MainMenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_timer_timeout():
	started = true


func _on_polaroid_timeout():
	if frame == 1:
		$polaroid.play("park")
		$polaroid.rotate(12.2)
		$polaroid.position = Vector2(830, 793)
	if frame == 2:
		$polaroid.play("mayor")
		$polaroid.rotate(-24.4)
		$polaroid.position = Vector2(830, 793)
	if frame == 3:
		$polaroid.play("school")
		$polaroid.rotate(24.4)
		$polaroid.position = Vector2(830, 793)
	if frame == 4:
		$polaroid.play("courthouse")
		$polaroid.rotate(-24.4)
		$polaroid.position = Vector2(830, 793)
	
	frame+=1
	print(frame)
	move = true
	$movetimer.start()

func _on_ppausetimer_timeout():
	move = true


func _on_movetimer_timeout():
	move = false
	$ppausetimer.start()


func _on_Skip_pressed():
	end()


func _on_mainmenu_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")
