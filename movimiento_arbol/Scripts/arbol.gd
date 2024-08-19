extends Node3D

var Mass_Front = 0
var Mass_Back = 0
var Mass_Left = 0
var Mass_Right = 0

func add_mass(mass, Zone):
	if Zone == "Front":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(-mass,0,0), sqrt(mass))
	elif Zone == "Back":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(mass,0,0), mass)
	elif Zone == "Left":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,-mass), mass)
	elif Zone == "Right":
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,mass), mass)
