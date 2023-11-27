extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(sfx_manager)

func generateInfo(dict):
	if !sfx_manager.is_sfx_playing("courtroom_paper"):
		sfx_manager.stop_sfx("courtroom_paper")
		sfx_manager.play_sfx("courtroom_paper")
	visible = true
	var text = "Name: " + dict["Name"] 
	if("Age" in dict):
		text += "\n" + "\n"+"Age: " + dict["Age"]
	text += "\n" + "\n"+"Case: " + dict["Case"]
	$Label.text = text

func _process(delta):
	if visible and Input.is_action_just_pressed("back"):
		if !sfx_manager.is_sfx_playing("courtroom_paper"):
			sfx_manager.stop_sfx("courtroom_paper")
			sfx_manager.play_sfx("courtroom_paper")
		visible = false
		get_parent().get_node("docTableOpen").visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
