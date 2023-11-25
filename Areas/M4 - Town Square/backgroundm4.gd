extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bgspeed = 200
func _physics_process(delta):
	scroll_base_offset -= Vector2(bgspeed,0) * delta
