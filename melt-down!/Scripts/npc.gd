extends Area2D

func _ready():
	visible = false
	self.body_entered.connect(_on_body_entered) #automatically connect signals
	self.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node):
	if body.is_in_group("Player"):
		print("player entered")
		visible = true
		#collision logic using groups / signals

func _on_body_exited(body: Node2D) -> void:
	visible = false
	pass # Replace with function body.
