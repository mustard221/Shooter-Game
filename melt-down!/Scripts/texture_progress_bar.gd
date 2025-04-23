extends TextureProgressBar

@onready var sound: AudioStreamPlayer = $"Yay-92370(mp3Cut_net)"

var timer: Timer
var tween: Tween
var is_done: bool = false

func _ready():
	timer = Timer.new()
	timer.wait_time = 0.1
	add_child(timer)
	tween = Tween.new()
	create_tween()
	sound.volume_db = 0  # full volume
	sound.stop()

func _on_boy_area_entered(area: Area2D) -> void:
	if area.name == "icecream" and not is_done:
		timer.start()
		shot()
		if not sound.playing:
			sound.play()

func shot():
	print("shot fired")
	value += 4
	if value >= 62.0:
		value = 100.0
		is_done = true
		timer.stop()
		fade_out_sound()

func fade_out_sound(): #using tweens to control sound
	tween.tween_property(sound, "volume_db", -10, 0.1)
	tween.tween_callback(sound.stop) 
