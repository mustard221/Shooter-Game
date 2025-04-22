extends TextureRect

@onready var timer: Timer = $Tuttimer
@onready var timer2: Timer = $Tuttimer2

 #Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	timer.start()

func _on_tuttimer_timeout() -> void:
	visible = true
	timer2.start()
	#pass # Replace with function body.

func _on_tuttimer_2_timeout() -> void:
	queue_free()
	pass # Replace with function body.
