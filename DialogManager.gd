extends Node

onready var text_box_scene = preload("res://textbox.tscn")

var dialog_lines: Array = []
var current_line_index = 0

var text_box
var text_box_position: Vector2

var is_dialog_active = false
var can_advance_line = false

var audio = preload("res://Text Audio.tscn").instance()

func _ready():
	pass

func start_dialog(position: Vector2, lines: Array):
	if is_dialog_active:
		return
	dialog_lines = lines
	text_box_position = position
	is_dialog_active = true
	can_advance_line = true
	text_box = null

func end_dialog():
	is_dialog_active = false
	can_advance_line = false
	

func _show_text_box():
	text_box = text_box_scene.instance()
	text_box.connect("finished_displaying", self, "_on_text_box_finished_displaying")
	print(get_tree().root.get_children())
	get_tree().root.get_children()[-1].get_node("CanvasLayerText").add_child(text_box)
	get_tree().root.get_children()[-1].get_node("CanvasLayerText").layer = 0
	#get_tree().root.add_child(text_box)
	text_box.set_global_position(text_box_position)
	
	text_box.display_text(dialog_lines[current_line_index])
	audio.get_node("Audio").play()
	can_advance_line = false
	
func _on_text_box_finished_displaying():
	audio.get_node("Audio").stop()
	can_advance_line = true
	 
func _unhandled_input(event):
	if (event.is_action_pressed("interact") && is_dialog_active && can_advance_line): 
		if text_box:
			text_box.queue_free()
		if current_line_index >= dialog_lines.size():
			is_dialog_active = false
			current_line_index = 0
			return
		GodotTTS.speak(dialog_lines[current_line_index])
		_show_text_box()
		current_line_index += 1
		

