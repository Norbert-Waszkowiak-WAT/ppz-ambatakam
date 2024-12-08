extends Node2D

# Path to the new scene
@export var scene_to_load : String = "res://graj.tscn"

func _ready():
	# Enable processing for input events
	set_process_input(true)

# Input handling for `ui_accept` (usually Enter or Space key)
func _input(event):
	if event is InputEventKey and event.pressed and Input.is_action_pressed("ui_accept"):
		change_scene_to_graj()

# This method loads the graj.tscn scene
func change_scene_to_graj():
	get_tree().change_scene(scene_to_load)
