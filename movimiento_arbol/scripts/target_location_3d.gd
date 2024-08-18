extends Area3D

@export var Item = "Decoration"
var completed = false

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if body is CharacterBody3D:
		print("In the inventory: ", body.inventory)
		if body.inventory == Item && body.interacting && not completed:
			body.inventory = ""
			completed = true
			print("COMPLETED")
