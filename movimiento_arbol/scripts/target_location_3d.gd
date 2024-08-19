extends Area3D

@export var Item = "Decoration"
@export var Adorno = Area3D
@export var Zone = "Front"
@onready var player_3d = get_tree().get_current_scene().get_node("Player3D")
@onready var arbol = get_tree().get_current_scene().get_node("Arbol")

var completed = false
var Player_inside = false


func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	Pick_up()

func _on_body_entered(body):
	print("ENTRE")
	if body is CharacterBody3D:
		Player_inside = true

func _on_body_exited(body):
	print("SALI")
	if body is CharacterBody3D:
		Player_inside = false

func Pick_up():
	if player_3d.inventory == Item && player_3d.interacting && not completed && Player_inside == true:
		player_3d.inventory = ""
		completed = true
		arbol.add_mass(Adorno.mass, Zone)
		#Determina la posicion del adorno al colocar
		if Zone == "Front":
			Adorno.position = self.position + Vector3(0,-2,4)
		elif Zone == "Back":
			Adorno.position = self.position + Vector3(0,-2,-4)
		elif Zone == "Left":
			Adorno.position = self.position + Vector3(-4,-2,0)
		elif Zone == "Right":
			Adorno.position = self.position + Vector3(5,-2,0)
		Adorno.Picked_up = false
		print("COMPLETED")
