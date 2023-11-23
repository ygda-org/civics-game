extends MarginContainer

var text = ""
var letter_index = 0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

const MAX_WIDTH = 1024

var label
var timer


func _ready():
	label = $MarginContainer/Label
	timer = $LetterDisplayTimer

signal finished_displaying()

func display_text(text_to_display: String):
	_ready()
	text = text_to_display
	label.text = "\n"
	yield(self, "resized")
	label.text = text_to_display
	yield(self, "resized")
	rect_min_size.x = min(rect_size.x, MAX_WIDTH)
	
	if rect_size.x > MAX_WIDTH:
		label.autowrap = true
		yield(self, "resized")
		rect_min_size.y = rect_size.y
	rect_size = Vector2(1024, 100)
	set_global_position(Vector2((MAX_WIDTH-rect_size.x)/2, 600-rect_size.y))
	label.text = ""
	_display_letter()
	
func _display_letter():
	label.text += text[letter_index]
	letter_index += 1
	if letter_index >= text.length():
		emit_signal("finished_displaying")
		return
		
	match text[letter_index]:
		"!", ".", ",", "?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)
	

func _on_LetterDisplayTimer_timeout():
	_display_letter()


func _on_Label_resized():
	pass
