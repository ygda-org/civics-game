extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mintime = 1
var maxtime = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	randtime()
	connect("timeout", self, "randtime")

func _starttime():
	randtime()
	.starttime()

func randtime():
	set_wait_time(rand_range(mintime, maxtime))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
