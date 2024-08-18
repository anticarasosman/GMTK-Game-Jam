extends Area3D

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if body is CharacterBody3D:
		if body.interacting:
			body.inventory = ""
			print("Cleared inventory")
