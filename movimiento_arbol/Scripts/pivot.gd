extends Node3D
@onready var player_3d = get_tree().get_current_scene().get_node("Player3D")

func rotate_cam_L():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,90,0), player_3d.rotation_time)
	
func rotate_cam_R():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees+Vector3(0,90,0), player_3d.rotation_time)
