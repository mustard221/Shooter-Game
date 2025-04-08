extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _draw() -> void:
	var pos = Vector2(0, 0)
	
	draw_circle(pos, 50, Color.ANTIQUE_WHITE, true)
	draw_circle(pos, 20, Color.BLACK, true)
	draw_circle(pos, 10, Color.BLACK, true)
