extends Label

@onready var clock: AudioStreamPlayer = $"Clock-ticking-53528"
@onready var timeUp: AudioStreamPlayer = $"Bedside-clock-alarm-95792"
@onready var customer_counter = get_node("../../../..")

@export var mouse1: Sprite2D
@export var mouse2: Sprite2D
@export var button: Button
@export var txt: Label
@export var txt2: Label
@export var overlay: Sprite2D
@export var timer: Timer

var time: bool = false
var score: int = 0

func _on_timer_2_timeout() -> void:
	time = true
	timer.start()
	clock.play()

func _process(delta: float) -> void:
	if time and is_instance_valid(timer):
		$".".text = "%d:%02d" % [floor(timer.time_left / 60), int(timer.time_left) % 60]
	else:
		return

# display timer values
func _on_timer_timeout() -> void:
	overlay.visible = true
	
	if is_instance_valid(mouse1):
		mouse1.queue_free()
	else:
		return
	
	mouse2.visible = true
	
	if is_instance_valid(timer):
		timer.queue_free()
	else:
		return
	
	if clock.play:
		clock.stop()
	
	if timeUp.stop:
		timeUp.play()
			
	if is_instance_valid(customer_counter):
		score = (15 - customer_counter.counter) * 100 #calculate score
		
		if is_instance_valid(txt):
			txt.visible = true  
		if is_instance_valid(button):
			button.visible = true
			button.disabled = false
	
	for node in get_tree().get_nodes_in_group("main"):
		node.set_process(false)
		node.set_physics_process(false)
		
func _on_button_pressed() -> void:
	if timeUp.play:
		timeUp.stop()
		
	if is_instance_valid(txt):
		txt.queue_free()
	if is_instance_valid(button):
		button.queue_free()
		
	txt2.visible = true
	txt2.text = "Score: %d" % score
