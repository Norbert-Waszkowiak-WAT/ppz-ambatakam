extends Node2D  # Assuming this is attached to a Node2D or any other node in your scene

# This function is called when any input event is received.
func _input(event):
	# Check if the input is a press of the ui_accept action (typically enter or space)
	if event.is_action_pressed("ui_accept"):
		load_scene()

# Function to load the 'racer.tscn' scene
func load_scene():
	var scene_path = "res://racer.tscn"  # Path to the scene
	if ResourceLoader.exists(scene_path):  # Check if the scene exists before loading
		get_tree().change_scene_to_file("res://racer.tscn")  # Switch to the new scene
	else:
		print("Failed to load scene 'racer.tscn'. Scene does not exist.")
