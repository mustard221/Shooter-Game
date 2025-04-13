extends CharacterBody2D

@export var speed: float = 1000
@export var back_speed: float = 400  # positive value, we negate it in code
@export var turn_speed_deg: float = 250
@export var friction: float = -5  # keep small for now to see movement

func _physics_process(delta: float) -> void:
	var moving = false

	# Movement input
	if Input.is_action_pressed("forward_input"):
		var acceleration = -transform.y * speed
		velocity += acceleration * delta
		moving = true
		print("Moving forward")

	if Input.is_action_pressed("back_input"):
		var acceleration = transform.y * back_speed
		velocity += acceleration * delta
		moving = true

	# Rotation input (only rotate when moving)
	if moving:
		var turning_input = Input.get_axis("turn_left_input", "turn_right_input")
		var turn_speed = deg_to_rad(turn_speed_deg)
		turn_speed = turn_speed / 2
		rotation += turning_input * turn_speed * delta

	# Apply friction
	apply_friction(delta)

	# Move character
	move_and_slide()

func apply_friction(delta):
	var friction_force = velocity * friction * delta
	velocity += friction_force
