extends Area3D

@export var Item = "Decoration"
@onready var player_3d = get_tree().get_current_scene().get_node("Player3D")

var completed = false
var Player_inside = false


func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	Pick_up()

func _on_body_entered(body):
	if body is CharacterBody3D:
		Player_inside = true

func _on_body_exited(body):
	if body is CharacterBody3D:
		Player_inside = false

func Pick_up():
	if Player_inside:
		print("In the inventory: ", player_3d.inventory)
		if player_3d.inventory == Item && player_3d.interacting && not completed:
			player_3d.inventory = ""
			completed = true
			print("COMPLETED")
