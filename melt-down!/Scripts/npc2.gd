extends Area2D

@onready var voice: AudioStreamPlayer = $Child
@onready var txt: Label = $Dialogue1
@onready var bar: ProgressBar = $TextureProgressBar

var timer: Timer
var blip_count := 0
var max_blips := 5
var has_played := false

func _ready():
	timer = Timer.new()
	timer.wait_time = 0.1
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

	txt.visible = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node):
	if body.name == "Player" and !has_played: 
		txt.visible = true
		blip_count = 0  
		has_played = true  
		timer.start()

	if body.name == "icecream":
		bar.value -= 10  # Reduce bar value when player hits ice cream

func _on_body_exited(body: Node2D):
	if body.name == "Player":
		txt.visible = false
		timer.stop()  
		blip_count = 0  
		has_played = false

func _on_timer_timeout():
	if blip_count < max_blips:
		voice.play()
		blip_count += 1  
	else:
		voice.stop()
		timer.stop()
