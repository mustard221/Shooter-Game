extends TextureProgressBar

@onready var sound: AudioStreamPlayer = $fill
@onready var yay: AudioStreamPlayer = $"Yay-6120"
@onready var text: Label = $"../Dialogue1"
@onready var particles: GPUParticles2D = get_node_or_null("GPUParticles2D")

var timer: Timer
var is_done: bool = false

func _ready():
	add_to_group("progress_bars")
	
	if particles:
		particles.emitting = false
	
	timer = Timer.new()
	timer.wait_time = 0.1
	add_child(timer)
	create_tween()
	
	sound.stop()

func _on_boy_area_entered(area: Area2D) -> void:
	if area.name == "icecream" and not is_done: #detecting when being shot
		timer.start()
		shot()
		if not sound.playing:
			sound.volume_db = 0 
			sound.pitch_scale = 5.0
			sound.play()
			sound.volume_db = 0 
			sound.pitch_scale = 5.0

func shot():
	print("shot fired")
	value += 2
	if value >= 60.0:
		value = 100.0
		is_done = true
		timer.stop()
		yay.play()
		if particles:
			particles.emitting = true
		text.text = "Yummy, thank you!"  # change the text when done
