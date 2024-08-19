extends Node3D

func _process(_delta):
	if rotation_degrees.x > 11 or rotation_degrees.z > 11:
		get_tree().change_scene_to_file("res://Escenas/control.tscn")

func add_mass(mass, Zone):
	if Zone == "Front":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(-mass,0,0), mass)
	elif Zone == "Back":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(mass,0,0), mass)
	elif Zone == "Left":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,-mass), mass)
	elif Zone == "Right":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,mass), mass)
