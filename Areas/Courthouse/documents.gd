extends AnimatedSprite


var num_frames
var current_frame = 0


func _ready():
	set_process_input(true)
	num_frames = get_sprite_frames().get_frame_count("documents")

func go_right():
	current_frame = (current_frame + 1) % num_frames
	set_frame(current_frame)
	
func go_left():
	if current_frame > 0:
		current_frame = (current_frame - 1) % num_frames
	else:
		current_frame = num_frames-1
	set_frame(current_frame)

func _on_right_pressed():
	go_right()
	
func _on_left_pressed():
	go_left()

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		go_right()
	elif Input.is_action_just_pressed("ui_left"):
		go_left()
