extends Button
# scene switcher
func _on_pressed() -> void:
	print("pressed") #debug
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
