extends Node3D
@onready var player_3d = $"../Player3D"

func _process(_delta):
	if Input.is_action_just_pressed("Rotate_cam_L") and player_3d.rotate == true:
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,90,0), player_3d.rotation_time)
	elif Input.is_action_just_pressed("Rotate_cam_R") and player_3d.rotate == true:
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees+Vector3(0,90,0), player_3d.rotation_time)
