extends Control

func _on_start_pressed():
	AudioPlayer.start_game()
	get_tree().change_scene_to_file("res://Escenas/Niveles/Level1.tscn")

func _on_options_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
