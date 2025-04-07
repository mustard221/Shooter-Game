extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var player = get_tree().get_root().get_node("Node2D/Player")
	
	var direction = (player.position - position).normalized()
	
	direction = direction.normalized
	
	velocity = direction * SPEED
	
	move_and_slide()
