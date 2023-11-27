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
var curAmends = []
var chosen = [0, 0]
var chosen_i = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(Input.is_action_just_pressed("back") and visible):
		visible = false
		get_parent().get_node("Player").frozen = false
	if(Input.is_action_just_pressed("info") and visible):
		visible = false
		get_parent().get_node("AmendmentInfo").visible = true
	if(Input.is_action_just_pressed("confirm") and visible):
		if(chosen[0] in get_parent().masterLst[get_parent().caseNum-1]["Support"] and chosen[1] in get_parent().masterLst[get_parent().caseNum-1]["Support"]):
			$Chosen.text = "Correct"
		else:
			$Chosen.text = 'Incorrect'
			

func print_case(dict):
	$Name.text = "Find two relevant amendments to deliver a verdict on " + dict["Name"]
	$Case.text = "Case: " + dict["Case"]

func set_amends(caseNum):
	if(caseNum== 1):
		curAmends = [4, 8, 14, 19, 21]
	if(caseNum == 2):
		curAmends = [19, 26, 13, 8, 6]
	if(caseNum == 3):
		curAmends = [13, 1, 3, 4, 6]
	if(caseNum == 4): 
		curAmends = [21, 6, 19, 14, 26]
	if(caseNum == 5):
		curAmends = [3, 14, 1, 8, 19]
	for child in $HBoxContainer.get_children():
		child.set_amend()
	get_parent().get_node("AmendmentInfo").generateInfo(curAmends)

func display_chosen(AmendNum):
	if(not AmendNum in chosen):
		chosen[chosen_i] = AmendNum
		chosen_i = (chosen_i + 1)%2
	var text = "You Have Selected Amendment " + str(chosen[0])
	if chosen[1] > 0:
		text += " And Amendment " + str(chosen[1])
	$Chosen.text = text + "\n" + "Press Y to confirm. Otherwise press a different number to make changes" 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
