extends Sprite2D

var speed = 10 
var can_move = false

func _on_timer_timeout() -> void:
	can_move = true

func _physics_process(delta: float) -> void:
	if can_move:
		position.y += speed * delta 
