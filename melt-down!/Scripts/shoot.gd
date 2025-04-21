extends Marker2D

@export var iceCream: PackedScene
var cooldown := 0.0
var delay := 0.075
var max_fire_time := 2.0
var time_held := 0.0
var can_shoot = true

func _physics_process(delta: float) -> void:
	cooldown -= delta
	if Input.is_action_pressed("fire") and can_shoot: #firing logic
		if cooldown <= 0.0: #add cooldown for shooting
			var shoot = iceCream.instantiate()
			shoot.global_position = global_position
			get_tree().current_scene.add_child(shoot)
			cooldown = delay
		time_held += delta # calculate amount of time since fired to input cooldown if needed
		if time_held >= max_fire_time:
			can_shoot = false #stop shooting if time reached
	else:
		time_held -= delta
		if time_held <= 0:
			can_shoot = true
