extends Label

@export var timer: Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$".".text = "%d:%02d" % [floor(timer.time_left / 60), int(timer.time_left) % 60]
#display timer values
