extends CharacterBody2D

@export var rotation_speed: float = 0.2

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	for i in range(get_slide_collision_count()):
		var collision: KinematicCollision2D = get_slide_collision(i)
		if collision.get_collider().name == "Player":
			var push = collision.get_collider_velocity()
			velocity = collision.get_normal() * push.length() # get normal to find direction of collision then use velocity & length funcs to apply push
			
			var turn = push.angle()
			rotation += turn * rotation_speed * delta  # can rotate by finding angle of collision and applying with speed & time
			
	move_and_slide()
