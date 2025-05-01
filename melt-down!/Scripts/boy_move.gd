extends AnimatedSprite2D

@onready var timer: Timer = $walkingTime

var speed = 10 
var can_move = false

func _on_timer_timeout() -> void:
	play()
	can_move = true
	timer.start()

func _physics_process(delta: float) -> void:
	if can_move:
		position.y += speed * delta 

func _on_walking_time_timeout() -> void:
	can_move = false 
	freeze_animation()
	
func freeze_animation() -> void:
	stop()
