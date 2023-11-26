extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inrange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_docTable_body_entered(body):
	inrange = true # Replace with function body.
	$Label.visible = true


func _on_docTable_body_exited(body):
	inrange = false # Replace with function body.
	$Label.visible = false
