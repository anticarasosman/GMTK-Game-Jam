extends Node3D

var Mass_Front = 0
var Mass_Back = 0
var Mass_Left = 0
var Mass_Right = 0

#Reemplazar los valores "5" del Vector3 por la masa de la decoracion
func add_mass_front(mass):
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(-mass,0,0), mass)
		
func add_mass_down(mass):
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(mass,0,0), mass)

func add_mass_left(mass):
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,-mass), mass)
		
func add_mass_right(mass):
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,mass), mass)
