extends Node3D

var Mass_Front = 0
var Mass_Back = 0
var Mass_Left = 0
var Mass_Right = 0

#Reemplazar los valores "5" del Vector3 por la masa de la decoracion
func _on_front_button_down():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(-5,0,0), 1)
		
func _on_back_button_down():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(5,0,0), 1)

func _on_left_button_down():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,-5), 1)
		
func _on_right_button_down():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,0,5), 1)
