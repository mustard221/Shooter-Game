extends Marker2D

@export var iceCream: PackedScene
@onready var cooldown_bar: ProgressBar = $"../../../../UI/Control/Cooldown"

var ammo := 100.0
var reload_time := 2.0
var max_ammo := 100.0
var max_fire_time := 5.0
var time_held := 0.0
var time_since_last_shot := 0.0 
var fire_delay: float = 0.05 
var can_shoot = true
var reloaded = true

func _physics_process(delta: float) -> void:
	#shoot logic
	var aim_vector = get_global_mouse_position() - global_position
	#can't shoot self logic moved here
	if aim_vector.length() < 20.0:
		can_shoot = false
	else:
		can_shoot = true
		
	if Input.is_action_pressed("fire") and can_shoot and reloaded and ammo > 0:
		time_since_last_shot += delta 
		
		if time_since_last_shot >= fire_delay:
			var shoot = iceCream.instantiate()
			shoot.global_position = global_position
			get_tree().current_scene.add_child(shoot)
			ammo -= 1  # Deduct 1 ammo per shot
			cooldown_bar.value = (ammo / max_ammo) * 100  # Update the progress bar
			time_since_last_shot = 0.0
		# drain ammo ONLY if shot happens
		ammo -= delta * (max_ammo / max_fire_time)
		cooldown_bar.value = (ammo / max_ammo) * 100
		time_held += delta

		if ammo <= 0.0:
			ammo = 0.0
			reloaded = false
			can_shoot = false

	# reset time when not holding button
	if !Input.is_action_pressed("fire") and time_held > 0:
		time_held = 0

	# reload logic reset everything
	if !reloaded and Input.is_action_pressed("reload"):
		reload_time -= delta
		cooldown_bar.value = (1 - reload_time / 3.0) * 100

		if reload_time <= 0.0:
			reloaded = true
			can_shoot = true
			ammo = max_ammo
			reload_time = 3.0
			cooldown_bar.value = 100
