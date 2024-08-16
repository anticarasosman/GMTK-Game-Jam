extends Area2D

@export var Item = "Decoration"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	if body is CharacterBody2D:
		print("In the inventory: ", body.inventory)
		if body.inventory == "":
			body.inventory = Item
