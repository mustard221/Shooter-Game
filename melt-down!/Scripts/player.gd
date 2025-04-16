extends CharacterBody2D

@export var speed: float = 1000
@export var back_speed: float = 400 
@export var turn_speed_deg: float = 50
@export var rot_dir:float = 0
@export var friction: float = -5  # keep small for now to see movement

func _physics_process(delta: float) -> void:
	var moving = false

	# Movement input
	if Input.is_action_pressed("forward_input"):
		var acceleration = -transform.y * speed
		velocity += acceleration * delta
		moving = true

	if Input.is_action_pressed("back_input"):
		var acceleration = transform.y * back_speed
		velocity += acceleration * delta
		moving = true

	# Rotation input (only rotate when moving)
	if moving:
		var turning_input = Input.get_axis("turn_left_input", "turn_right_input")
		var turn_speed = deg_to_rad(turn_speed_deg)
		turn_speed = turn_speed / 2
		if Input.is_action_pressed("turn_left_input"):
			rot_dir -= 1
		if Input.is_action_pressed("turn_right_input"):
			rot_dir += 1
		var rot_dir = clamp(5, 10, 5)
		rotation += turning_input * rot_dir * turn_speed * delta

	# Apply friction
	apply_friction(delta)

	# Move character
	move_and_slide()

func apply_friction(delta):
	var friction_force = velocity * friction * delta
	velocity += friction_force
