extends Marker2D

@export var iceCream: PackedScene
var cooldown := 0.0
var delay := 0.075#seconds between shots

func _physics_process(delta: float) -> void:
	cooldown -= delta
	if Input.is_action_pressed("fire") and cooldown <= 0.0:
		var shoot = iceCream.instantiate()
		shoot.global_position = global_position
		get_tree().current_scene.add_child(shoot)
		print("spawns at: ", shoot.global_position)
		cooldown = delay  # reset cooldown
