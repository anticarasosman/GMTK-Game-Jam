extends Control

func _on_quit_button_pressed():
	get_tree().quit()

func _on_retry_button_pressed():
	AudioPlayer.on_menu()
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
