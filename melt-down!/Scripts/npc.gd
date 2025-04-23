extends Area2D

#@onready var voice: AudioStreamPlayer = $Child
var txt: Label

func _ready():
	txt = get_node_or_null("Dialogue")
	if txt:
		txt.visible = false
		
	self.body_entered.connect(_on_body_entered) # automatically connect signals
	self.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node):
	if body and body.name == "Player":  # check if correct node
		print("player entered")
		txt.visible = true
		#voice.play()
		# collision logic using signals

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		txt.visible = false
		#voice.stop()
		pass  # Replace with function body
