extends AnimatedSprite2D

var speed = 5 
var can_move = true

func _ready() -> void:
	play()
	
	var timer = get_node("walkTime")
	
	if timer and timer is Timer:
		timer.connect("timeout", Callable(self, "_on_timer_timeout"))
		
	timer.start()

func _physics_process(delta: float) -> void:
	if can_move:
		position.x += speed * delta 
		
func _on_timer_timeout() -> void:
	can_move = false 
	freeze_animation()
	
func freeze_animation() -> void:
	stop()
