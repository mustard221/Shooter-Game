extends CharacterBody2D

@onready var sound: AudioStreamPlayer = $"Van/Driving-65528"
@onready var crash: AudioStreamPlayer = $Van/crash
@export var speed: float = 1500
@export var back_speed: float = 600 
@export var turn_speed_deg: float = 210
@export var friction: float = -10

#var can_move = false  # movement locked until timer ends

#func _on_tuttimer_timeout() -> void:
#	can_move = true

func _physics_process(delta: float) -> void:
	#if !can_move:
	#	return  # skip everything until timer ends

	var moving = false
	var moving_forward = false

	if Input.is_action_pressed("forward_input"):
		var acceleration = -transform.y * speed
		velocity += acceleration * delta
		moving = true
		moving_forward = true

	if Input.is_action_pressed("back_input"):
		var acceleration = transform.y * back_speed
		velocity += acceleration * delta
		moving = true
		moving_forward = false

	if moving:
		var turning_input = Input.get_axis("turn_left_input", "turn_right_input")
		var turn_speed = deg_to_rad(turn_speed_deg) / 2
		var direction = 1 if moving_forward else -1
		rotation += turning_input * turn_speed * direction * delta
		
	if moving and moving_forward:
		if !sound.playing:
			sound.play()
	else:
		sound.stop()

	apply_friction(delta)

	var collision = move_and_collide(velocity * delta)
	
	if collision and !crash.playing:
		crash.play()
		moving = false
		moving_forward = false
		velocity = -velocity * 1  # slight recoil

func apply_friction(delta):
	var friction_force = velocity * friction * delta
	velocity += friction_force
