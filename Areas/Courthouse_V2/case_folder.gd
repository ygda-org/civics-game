extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var number: int
var input 
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = String(number)# Replace with function body.
	print(number)
	input = ["first", "second", "third", "fourth", "fifth", "sixth"][number-1]
	print(input)

func _process(delta):
	
	if get_parent().visible and Input.is_action_just_pressed(input):
		print("yes")
		get_parent().choose_case(number)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
