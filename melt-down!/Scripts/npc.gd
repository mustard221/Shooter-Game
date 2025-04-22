extends Area2D

func _ready():
	visible = false
	self.body_entered.connect(_on_body_entered) # automatically connect signals
	self.body_exited.connect(_on_body_exited)

func _on_body_entered(body: CharacterBody2D):
	if body and body.name == "Player":  # check if correct node
		print("player entered")
		visible = true
		# collision logic using signals

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		visible = false
		pass  # Replace with function body
