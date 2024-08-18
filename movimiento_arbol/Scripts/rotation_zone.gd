extends Area3D
@onready var player_3d = get_tree().get_current_scene().get_node("Player3D")

func _on_body_entered(body):
	if body is CharacterBody3D:
		player_3d.rotate = true

func _on_body_exited(body):
	if body is CharacterBody3D:
		player_3d.rotate = false
