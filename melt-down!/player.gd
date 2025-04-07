extends CharacterBody2D

@export var turn_rate:float=50
@export var speed:float=100

var acceleration:Vector2

func _physics_process(delta: float) -> void:
	if ! Engine.is_editor_hint():	
		# rotate w/ left and right
		var l = Input.get_axis("turn_left_input", "turn_right_input")
		rotate(l * delta * deg_to_rad(turn_rate))
		
		# move by applying acceration
		var m = Input.get_axis("forward_input", "back_input")
		acceleration = transform.y * m * speed
		velocity += acceleration * delta
		move_and_slide()
