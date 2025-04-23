extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# custom cursor script, hide system cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	# above all sprites
	z_index = 100

func _process(delta):
	#follows mouse position
	position = get_global_mouse_position()
