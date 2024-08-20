extends Node3D

@export var nextScene : String

var children
var completed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	print(children)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	children = get_children()
	if len(children) == 0:
		get_tree().change_scene_to_file(nextScene)
