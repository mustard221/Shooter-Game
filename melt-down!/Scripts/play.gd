extends Button
# scene switcher
@onready var sound: AudioStreamPlayer = $"Game-start-6104"
@export var timer: Timer

func _on_pressed() -> void:
	sound.play()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
