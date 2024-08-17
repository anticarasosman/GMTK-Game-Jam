extends Area3D
@onready var player_3d = $"../../Player3D"

func _on_body_entered(_body):
	player_3d.rotate = true

func _on_body_exited(_body):
	player_3d.rotate = false
	pass
