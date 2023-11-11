extends Control


#should be formatted like {question number: [question content, [answer a,b,c,d], correct answer]
var questions = {0: ["Which one?", ["hi", "bye", "t", "yay"], 3], 1: ["Which one?", ["a", "b", "t", "d"], 2]}
#should be formatted like {question number: [user answer, correct/incorrect]}
var userAnswers = {}
var length = len(questions)
var i = 0


func _ready():

	advance()
	
func advance():
	if i < len(questions):
		var question = questions[i]
		var questionNumber = str(i+1)
		var questionContent = question[0]
		var answers = question[1]
		var correctAnswer = question[2]
		print(answers)
		for j in range(len($Answers.get_children())):
			var a = $Answers.get_children()[j]

			a.get_children()[0].text = answers[j]
		$Question.bbcode_text = 	"[center]" + questionNumber + ". " + questionContent + "[/center]"
	else:
		print(userAnswers)
	

#im sure theres some super sexy way to do this but im lazy
func _on_First_pressed():
	if i < len(questions):
		userAnswers[i] = [1, 1 == questions[i][2]]
		i+= 1
	advance()

func _on_Second_pressed():
	if i < len(questions):
		userAnswers[i] = [2, 2 == questions[i][2]]
		i+= 1
	advance()

func _on_Third_pressed():
	if i < len(questions):
		userAnswers[i] = [3, 3 == questions[i][2]]
		i+= 1
	advance()

func _on_Fourth_pressed():
	if i < len(questions):
		userAnswers[i] = [4, 4 == questions[i][2]]
		i+= 1
	advance()
