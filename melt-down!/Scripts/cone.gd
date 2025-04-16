extends Sprite2D

var speed = 5.0 

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position() #simplified code
	var target_angle = (mouse_pos - global_position).angle()
	rotation = lerp_angle(rotation, target_angle, delta * speed)
