extends Area3D

@export var Item = "Decoration"
@export var mass = 0
@onready var player_3d = get_tree().get_current_scene().get_node("Player3D")

var Player_inside = false
var Picked_up = false
var Completed = false

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Picked_up == true:
		Completed = true
		self.position = player_3d.position + Vector3(0,1,0)
		self.rotation_degrees = player_3d.rotation_degrees
	Pick_up()

func _on_body_entered(body):
	if body is CharacterBody3D:
		Player_inside = true

func _on_body_exited(body):
	if body is CharacterBody3D:
		Player_inside = false

func Pick_up():
	if Player_inside:
		#print("In the inventory: ", player_3d.inventory)
		if player_3d.inventory == "" && player_3d.interacting && Completed == false:
			Picked_up = true
			player_3d.inventory = Item
			player_3d.inventory_instance = self
