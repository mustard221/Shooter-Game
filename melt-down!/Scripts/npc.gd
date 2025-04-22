extends Area2D

func _ready():
	self.body_entered.connect(_on_body_entered) #automatically connect signals

func _on_body_entered(body: Node):
	if body.is_in_group("Player"):
		print("player entered")
		#collision logic using groups / signals
