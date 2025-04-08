extends Sprite2D
# Tracking initial rotation and updating for every rotation
var last_rotation := 0.0  

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var Hdistance = mouse_pos.x - global_position.x
	var Vdistance = mouse_pos.y - global_position.y

	var target_rotation = rotation
#rotating cone 
	if Hdistance > 45:
		target_rotation = deg_to_rad(90)
	elif Hdistance < -45:
		target_rotation = deg_to_rad(-90)
	elif Vdistance > 0:
		target_rotation = deg_to_rad(180)
	elif Vdistance < 0:
		target_rotation = deg_to_rad(0)


	if target_rotation != last_rotation:
		last_rotation = target_rotation #Adds on previous rotation amount to new amount and repeats whenever rotated
		var tween = get_tree().create_tween()
		tween.tween_property(self, "rotation", target_rotation, 0.5).set_ease(Tween.EASE_IN)
