extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var correct = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(visible and correct == false):
		if(Input.is_action_just_pressed("N") and "Not Guilty" == get_parent().masterLst[get_parent().caseNum-1]["Verdict"]):
			$Label2.text = "Correct Try Another Case"
			correct = true
			get_parent().solve_case()
		elif(Input.is_action_just_pressed("guilty") and "Guilty" == get_parent().masterLst[get_parent().caseNum-1]["Verdict"]):
			$Label2.text = "Correct. Try Another Case"
			correct = true
			get_parent().solve_case()
		elif(Input.is_action_just_pressed("N") or Input.is_action_just_pressed("guilty")):
			$Label2.text = "Incorrect. Try Again"
	if visible and Input.is_action_just_pressed("back"):
		visible = false
		get_node("Label2").text = ""
		correct = false
		get_parent().get_node("Player").frozen = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
