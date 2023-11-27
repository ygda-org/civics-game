extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var curNum = 0
var text = "You have chosen case 0"
var info = ". Press i to view Info"

var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(sfx_manager)
	$Label.visible = false # Replace with function body.

func choose_case(num):
	curNum = num
	get_parent().setNum(num)
	if(not get_parent().caseSolved):
		print("e")
		text = text.substr(0, len(text)-2)
		text += " " + str(num)
		get_parent().get_node("juryTableOpen").set_amends(num)
		$Label.text = text + info
		$Label.visible = true
		
func _process(delta):
	if Input.is_action_just_pressed("back") and visible:
		print("back")
		visible = false
		get_parent().get_node("Player").frozen = false
	if Input.is_action_just_pressed("info") and curNum>0 and visible:
		visible = false
		get_parent().get_node("caseInfo").generateInfo(get_parent().masterLst[curNum - 1])
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
