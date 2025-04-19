extends Marker2D

@export var iceCream: PackedScene
var cooldown := 0.0
var delay := 0.05#seconds between shots
var active = true
var time = Vector2.ZERO


func _physics_process(delta: float) -> void:
	time = 0
	cooldown -= delta
	if Input.is_action_pressed("fire") and cooldown <= 0.0 and time < 0.9:
		var shoot = iceCream.instantiate()
		shoot.global_position = global_position
		get_tree().current_scene.add_child(shoot)
		print("spawns at: ", shoot.global_position)
		cooldown = delay  # reset cooldown
	else:
		iceCream.queue_free()
		_on_timer_timeout()

func _on_timer_timeout() -> void:
	time = 1.0
	pass # Replace with function body.
