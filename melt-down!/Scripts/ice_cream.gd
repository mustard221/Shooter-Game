extends RigidBody2D

@export var speed: float = 150.0

var direction: Vector2
var travel_direction: Vector2
#shoot toward mouse
func _ready() -> void:
	var aim_vector = get_global_mouse_position() - global_position
	direction = aim_vector.normalized()
	travel_direction = direction
	linear_velocity = direction * speed

	# subtle squashed random scale
	scale.x = randf_range(0.9, 1.3)
	scale.y = randf_range(0.6, 1.0)

	# rotate to look more messy / icecream-like
	rotation = randf_range(-0.2, 0.2)

# slow down velocity after shooting
func _on_timer_2_timeout() -> void:
	linear_velocity = travel_direction * speed / 100

#looks like it melts then disappears
func _on_timer_timeout() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale:y", 0.5, 0.5)
	tween.tween_property(self, "scale:x", 0.9, 0.1)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	tween.connect("finished", Callable(self, "_on_melt_finished"))

func _on_melt_finished() -> void:
	queue_free()
