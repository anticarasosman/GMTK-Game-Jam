extends Node3D

@export var nextScene : String

var children
var completed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	children = get_children()
	print(children)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var completed = true
	for child in children:
		if not child.completed:
			completed = false
	if completed:
		get_tree().change_scene_to_file(nextScene)
