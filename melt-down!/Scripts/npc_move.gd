extends Sprite2D

@onready var timer: Timer = $walkTime

var speed = 10 
var can_move = false

func _on_timer_timeout() -> void:
	can_move = true
	timer.start()

func _physics_process(delta: float) -> void:
	if can_move:
		position.y += speed * delta 

func _on_walk_time_timeout() -> void:
	can_move = false
	pass # Replace with function body.
