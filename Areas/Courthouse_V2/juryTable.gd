extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inrange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false # Replace with function body.

func _on_juryTable_body_entered(body):
	if "Player" in body.name and get_parent().caseNum > 0:
		$Label.visible = true
		inrange = true # Replace with function body.


func _on_juryTable_body_exited(body):
	if "Player" in body.name:
		$Label.visible = false
		inrange = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
