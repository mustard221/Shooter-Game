extends CharacterBody2D

@onready var player = get_node("root/Node2D/Player") 
@export var speed: float = 1500  

func _process(delta) -> void:
	var playerPos = player.position
	var playerVelocity = player.linear_velocity  
	
	var predictedPlayerPos = playerPos + playerVelocity * delta

	look_at(predictedPlayerPos)
