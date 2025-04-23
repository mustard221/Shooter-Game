extends Area2D

@onready var voice: AudioStreamPlayer = $Child
@onready var txt: Label = $Dialogue1

var is_playing = false
var has_played = false
var time_since_last = 0.0
var delay = 0.15
var stop = 0.0

func _ready():
	txt.visible = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if is_playing and has_played:
		time_since_last += delta
		stop += delta
		if time_since_last >= delay and stop >=0:
			voice.play()
			time_since_last = 0.0
		if stop >= 1.0:
			voice.volume_db = voice.volume_db / 2
			is_playing = false
			stop = 1.0

func _on_body_entered(body: Node):
	if body.name == "Player":
		txt.visible = true
		is_playing = true
		has_played = false
		stop = 0.0
		time_since_last = 0.0

func _on_body_exited(body: Node2D):
	if body.name == "Player":
		txt.visible = false
		is_playing = false
		has_played = true
		stop = 0.0
		time_since_last = 0.0
		voice.stop()
