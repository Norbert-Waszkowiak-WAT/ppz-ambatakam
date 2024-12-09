extends Area2D

# This function is called when any input event is received.
func _input(event):
	# Check if the input is a press of the ui_accept action (typically enter or space)
	if event.is_action_pressed("ui_accept"):
		load_scene()

# Function to load the 'graj.tscn' scene
func load_scene():
	var scene = load("res://graj.tscn")  # Load the scene
	if scene:
		get_tree().change_scene_to_file("res://graj.tscn")  # Switch to the new scene
	else:
		print("Failed to load scene 'graj.tscn'")
