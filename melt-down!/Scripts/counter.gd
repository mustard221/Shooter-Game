extends Node2D

@onready var counter_label: Label = $UI/Control/Customers/Customers
var counter = 15

func _ready() -> void:
	counter_label.text = str(counter)
	
func _process(delta: float) -> void:
	for pb in get_tree().get_nodes_in_group("progress_bars"):
		if pb.value >= 100.0 and not pb.has_meta("served"):
			counter -= 1
			counter_label.text = str(counter)
			pb.set_meta("served", true)
