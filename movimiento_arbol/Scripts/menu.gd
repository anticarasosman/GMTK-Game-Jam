extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Escenas/pick-and-place_3d.tscn")

func _on_options_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
