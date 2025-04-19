extends RigidBody2D

@export var speed: float = 250.0

var direction: Vector2
var travel_direction: Vector2

func _ready() -> void:
	direction = (get_global_mouse_position() - global_position).normalized()
	travel_direction = direction
	linear_velocity = direction * speed

func _on_timer_2_timeout() -> void:
	linear_velocity = travel_direction * speed / 200

func _on_timer_timeout() -> void:
	queue_free()
