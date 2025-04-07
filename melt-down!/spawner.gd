extends Node2D

var kid 

func _ready():
	var spawn = load("res://npc.tscn")
	kid = spawn.instantiate()

func _process(delta: float) -> void:
	if kid and kid.get_parent() == null:
		add_child(kid) #spawn npcs
