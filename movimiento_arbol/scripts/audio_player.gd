extends AudioStreamPlayer

var menu_song = preload("res://Sound/Songs/We Wish You.mp3")
var level_song = preload("res://Sound/Songs/Open Those Bright Eyes.mp3")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = menu_song
	play()


func start_game() -> void:
	stream = level_song
	play()


func _on_finished() -> void:
	play()
