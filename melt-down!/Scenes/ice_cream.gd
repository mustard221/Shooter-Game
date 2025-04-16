extends RigidBody2D

@export var speed: float = 300.0
var range: float = 60.0 
var direction: Vector2

func _ready() -> void:
	direction = (get_global_mouse_position() - global_position).normalized()
	linear_velocity = direction * speed

func _physics_process(delta: float) -> void:
	var distance = (global_position - get_global_mouse_position()).length()
	print(distance)

	if distance <= range:
		linear_velocity = Vector2.ZERO

func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
