extends Sprite2D

@onready var timer: Timer = $walkingTime
@onready var animated_texture: AnimatedTexture = self.texture

var speed = 10 
var can_move = false

func _on_timer_timeout() -> void:
	can_move = true
	timer.start()

func _physics_process(delta: float) -> void:
	if can_move:
		position.y += speed * delta 

func _on_walking_time_timeout() -> void:
	can_move = false
	freeze_animation()
	
func freeze_animation() -> void:
	if animated_texture:
		animated_texture.pause = true
