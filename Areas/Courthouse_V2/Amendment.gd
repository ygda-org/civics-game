extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var number: int
var input 
var juryTableOpen
var AmendNum
# Called when the node enters the scene tree for the first time.
func _ready():
	$Number.text = String(number)# Replace with function body.
	print(number)
	input = ["first", "second", "third", "fourth", "fifth", "sixth"][number-1]
	juryTableOpen = get_parent().get_parent()
	print(input)
	
func set_amend():
	$Amend_num.text = "Amendment " + str(get_parent().get_parent().curAmends[number-1])
	AmendNum = get_parent().get_parent().curAmends[number-1]
	
func _process(delta):
	if juryTableOpen.visible and Input.is_action_just_pressed(input):
		print("yes")
		juryTableOpen.display_chosen(AmendNum)
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
