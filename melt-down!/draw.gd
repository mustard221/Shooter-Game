extends Sprite2D

@export var size = 100
@export var line_size = 2
@export var colour: Color = Color.WHITE

func _draw() -> void:
	# draw the van's shape — centered rectangle
	var rect_size = Vector2(100, 170)
	var rect_pos = Vector2(0, 0)
	var front = Vector2(12, -15)
	draw_rect(Rect2(rect_pos, rect_size), colour, true, line_size)
	draw_rect(Rect2((Vector2(17.5, 25)), (rect_size / 1.5)), Color.DARK_GRAY, true, line_size)
	draw_rect(Rect2(front, Vector2(75, 25)), colour, true, line_size)

func _process(delta: float) -> void:
	queue_redraw() # triggers draw func
pass
