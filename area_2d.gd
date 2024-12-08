extends Area2D

# Path to the new scene you want to load
@export var scene_to_load : String = "res://graj.tscn"

# Enable input event handling
func _ready():
	# Set this Area2D node to receive input events
	set_process_input(true)

# Detect key presses like "ui_accept" (Enter/Space, or your custom input action)
func _input(event):
	if event is InputEventKey:
		# Check if "ui_accept" is pressed (which is by default Enter or Space)
		if event.pressed and Input.is_action_pressed("ui_accept"):
			load_new_scene()

# Method to load the new scene
func load_new_scene():
	# Load the scene using the correct method for Godot 4
	var new_scene = load(scene_to_load)
	get_tree().change_scene_to(new_scene)
