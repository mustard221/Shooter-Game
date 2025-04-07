extends Sprite2D

@export var size = 100
@export var line_size = 2
@export var colour: Color = Color.WHITE

func _draw() -> void:
	
	# draw the van's shape — centered rectangle
	var rect_size = Vector2(100, 170)
	var pos = Vector2(0, 0)
	var front = Vector2(12, -15)
	var turret_pos = Vector2(37, -20)
	var wheel_pos = [Vector2(90, 130), Vector2(90, 35), Vector2(10, 130), Vector2(10, 35)]
	
	# Draw wheels
	for wheel in wheel_pos:
		draw_circle(pos + wheel, 25, Color.BLACK)

	draw_rect(Rect2(pos, rect_size), colour, true, line_size)
	draw_rect(Rect2((Vector2(17.5, 25)), (rect_size / 1.5)), Color.DARK_GRAY, true, line_size) # Roof
	draw_rect(Rect2(front, Vector2(75, 25)), colour, true, line_size) # Hood
	draw_rect(Rect2(turret_pos, Vector2(25, 50)), Color.PINK, true, line_size)
	
	# Ice-cream
	var cone_points = [Vector2(92, 35), Vector2(8, 35), Vector2(50, 175)]
	var colours = [Color.ORANGE, Color.ORANGE, Color.BEIGE]
	draw_circle((Vector2(50, 35)), 40, Color.LIGHT_PINK)
	draw_polygon(cone_points, colours)

func _process(delta: float) -> void:
	queue_redraw() # triggers draw func
pass
