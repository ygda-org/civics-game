extends Node2D



var caseNum = 0
var NumSolved = 0
var caseSolved = false

var sfx_manager_scene = preload("res://SFX/SFX_Manager.tscn")
var sfx_manager = sfx_manager_scene.instance()

var masterLst = [
	{"Name": "Joshua Cavin",
	"Age": "32",
	"Case": "Last Thursday, two police officers were in Mr. Calvin’s neighborhood and saw the suncatchers on his upstairs windows and suspected that he was partaking in illicit substances. When they were at his door, Mr. Calvin resisted the police officers and was arrested for not cooperating. He then refused to pay the $2,000,000 fine that he received and was charged with further punishment.",
	"Verdict": "Not Guilty",
	"Support": [4, 8]
	},
	{"Name": "Trevor Dillon",
	"Age": "27",
	"Case": "Trevor Dillon was in charge of voter registration for the upcoming House of Representatives elections for the congressional district. He is being sued by Martha Winthrop because when she attempted to register to vote, he stated that she supposedly did not meet eligibility requirements on account of being too young. Upon being presented her documents that showed she was 18, he denied her the right to vote on account of being a woman.",
	"Verdict": "Guilty",
	"Support": [19, 26]
	},
	{"Name" : "Jiminy’s Juice Bar",
	"Case": "Jiminy’s Juice Bar was accused of withholding payment from their workers and threatening harm to their families if they quit. In defense, they cite that in their mission statement, the company owns any and all people who enter their establishment. Jiminy’s Juice Bar was also flagging and reporting the statements of their workers to have the posts taken off of social media.",
	"Verdict": "Guilty",
	"Support": [13, 1]
	},
	{"Name": "Amber Fox",
	"Age": "24",
	"Case": "This past Wednesday, police officers arrested Amber Fox, a 24 year-old woman working as a barista for a local cafe, for purchasing alcoholic beverages after work. The police argued that under the 18th Amendment of the U.S. Constitution she was prohibited from purchasing alcoholic beverages. Ms. Fox’s criminal case was postponed for several months, to which Ms. Fox demanded that all charges be immediately dropped.",
	"Verdict": "Not Guilty",
	"Support": [21, 6]
	},
	{"Name": "Wilhelm Windrow",
	"Age": "37",
	"Case": "Wilhelm Windrow, a U.S. army soldier, was reported by his neighbor, Trent Moreau, to have been staying in his house without Moreau’s permission because he “preferred Trent’s house over his own.” Windrow argues that Moreau wasn’t a U.S. citizen since he was born in France, therefore he should have the right to live in the house, despite the fact that Moreau was legally naturalized as a U.S. citizen two decades prior.",
	"Verdict": "Guilty",
	"Support": [3, 14]
	}
]

func _ready():
	GodotTTS.speak("jury duty.  you have been summoned to jury duty. help the court decide the verdict. first, walk to the document table. pick a case with one through five then press i to read about it. you can press x to go back. second, go to the jurors table and select two ammendments to support your claim. third, declare your claim, innocent or guilty? press 1 to start.")
	add_child(sfx_manager)
	find_node("WorldEnvironment").environment.adjustment_brightness = MainGlobals.brightness
	find_node("WorldEnvironment").environment.adjustment_contrast = MainGlobals.contrast
	find_node("WorldEnvironment").environment.adjustment_saturation = MainGlobals.saturation
	$docTableOpen.visible = false
	$caseInfo.visible = false
	$docTable/Label.visible = false
	$juryTableOpen.visible = false
	$AmendmentInfo.visible = false
	$Verdict.visible = false


func _process(delta):
	$CanvasLayer2/round.text = "Cases Solved: " + str(NumSolved)

func setNum(num):
	if(get_node("docTableOpen/HBoxContainer/case_folder" + str(num) +"/unsolved").visible == true):
		caseSolved = false
		caseNum = num
	else:
		caseSolved = true
	
func solve_case():
	if !sfx_manager.is_sfx_playing("courtroom_gavel"):
			sfx_manager.stop_sfx("courtroom_gavel")
			sfx_manager.play_sfx("courtroom_gavel")
	get_node("docTableOpen/HBoxContainer/case_folder" + str(caseNum) +"/unsolved").visible = false
	get_node("docTableOpen/Label").text = ""
	if caseSolved == false:
		NumSolved += 1
	if(NumSolved == 3):
		get_tree().change_scene("res://Areas/Courthouse_V2/courthouseendmenu.tscn")
		MainGlobals.courthousewin = true
	caseSolved = true
	#get_node("case_folder" + str(caseNum)).queue_free()





