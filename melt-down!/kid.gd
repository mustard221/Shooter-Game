extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _draw() -> void:
	var line = 5
	var pos = Vector2(0, 0)
	
	draw_circle(pos, 50, Color.ANTIQUE_WHITE, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
