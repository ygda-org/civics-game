extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dctAmendments = {
	1: "People may not prohibit an individual’s freedom to express religion, press, speech, assembly, and petition.",
	
	3: "No Soldier shall, in time of peace be quartered in any house, without the consent of the Owner, nor in time of war, but in a manner to be prescribed by law.",
	
	4: "The right of a person to be secure in their own house and belongings against unreasonable search and seizure.",
	
	6: "The accused have the right to a speedy and public trial with a fair and impartial jury.",
	
	8: "Courts may not impose excessive bails/fines or cruel and unusual punishments.",
	
	13: "Slavery nor involuntary servitude, except in the case of punishment for a crime, is prohibited in the United States.",
	
	14: "All persons born or naturalized in the United States are citizens of the United States. States are not permitted to restrict any rights of the citizen.",
	
	19: "Citizens may not be denied the right to vote on account of sex.",
	
	21: "The eighteenth article of amendment to the Constitution of the United States is hereby repealed.",
	
	26: "Citizens over the age of 18 may not be denied the right to vote on account of age.",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func generateInfo(curAmends):
	var text = ""
	for amend in curAmends:
		text += 'Amendment ' + str(amend) + ": " + dctAmendments[amend] + "\n"
	$Label.text = text

func _process(delta):
	if visible and Input.is_action_just_pressed("back"):
		visible = false
		get_parent().get_node("juryTableOpen").visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
