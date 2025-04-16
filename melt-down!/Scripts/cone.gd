extends Sprite2D

var speed = 5.0 

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position() #simplified code
	look_at(mouse_pos)
