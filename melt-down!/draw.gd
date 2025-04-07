extends Sprite2D

@export var size = 100
@export var line_size = 2
@export var colour: Color = Color.WHITE

@onready var radius = size / 2

func _draw() -> void:
	# draw the van's shape — centered rectangle
	var rect_size = Vector2(radius * 2, radius * 3.5)
	var rect_pos = -rect_size / 2
	draw_rect(Rect2(rect_pos, rect_size), colour, false, line_size)

func _process(delta: float) -> void:
	radius = size / 2
	queue_redraw() # triggers draw func
pass
