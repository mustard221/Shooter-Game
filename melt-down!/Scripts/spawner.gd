extends Node2D

@export var spawn: PackedScene

func _ready() -> void:
	var npc = spawn.instantiate()
	get_tree().root.add_child.call_deferred(npc)

	if npc.has_method("_spawned"):
		npc._spawned()
