extends Sprite2D

var target_rotation = rotation  # initial target rotation
var speed = 100

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var Hdistance = mouse_pos.x - global_position.x
	var Vdistance = mouse_pos.y - global_position.y
	
	if Hdistance > 45:
		target_rotation = deg_to_rad(90)  
	elif Hdistance < -45:
		target_rotation = deg_to_rad(-90)  
	elif Vdistance < 0:
		target_rotation = deg_to_rad(0) 
	elif Vdistance > 10:
		target_rotation = deg_to_rad(180) 
	

	var tween = get_tree().create_tween() #smoother rotating using lerp to calculate smallest angle
	tween.tween_property(self, "rotation", lerp_angle(rotation, target_rotation, delta * speed), 0.25).set_trans(Tween.TRANS_LINEAR)
