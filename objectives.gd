extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var open = true

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in $checks.get_children():
		child.play("unchecked")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if MainGlobals.schoolwin:
		$checks/schoolcheck.play("checked")
	else:
		$checks/schoolcheck.play("unchecked")
	if MainGlobals.parkwin:
		$checks/parkcheck.play("checked")
	else:
		$checks/parkcheck.play("unchecked")
	if MainGlobals.townsquarewin:
		$checks/townsquarecheck.play("checked")
	else:
		$checks/townsquarecheck.play("unchecked")
	if MainGlobals.courthousewin:
		$checks/courthousecheck.play("checked")
	else:
		$checks/courthousecheck.play("unchecked")
	if open:
		$ColorRect.visible = true
		$Control.visible = true
		$checks.visible = true
	else:
		$ColorRect.visible = false
		$Control.visible = false
		$checks.visible = false

func _input(event):
	if Input.is_action_just_pressed("hideobjective"):
		if open:
			open = false
		elif !open:
			open = true

func _on_show_pressed():
	if open:
		open = false
	elif !open:
		open = true
