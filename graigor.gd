extends CollisionShape2D

# Boolean flag to check if player is inside the area
var player_inside = false

# This function is called when any input event is received.
func _input(event):
	# Check if the player is inside and if the input is a press of the ui_accept action
	if player_inside and event.is_action_pressed("ui_accept"):
		load_scene()

# Function to load the 'graj.tscn' scene
func load_scene():
	var scene = load("res://racer.tscn")  # Load the scene
	if scene:
		get_tree().change_scene_to_file("res://racer.tscn")  # Switch to the new scene
	else:
		print("Failed to load scene 'racer.tscn'")

# This function is called when a body (e.g., player) enters the Area2D
func _on_Area2D_body_entered(body):
	# Check if the body is the player or another object you want to trigger the event
	if body.is_in_group("player"):  # Assuming the player is in the 'player' group
		player_inside = true

# This function is called when a body (e.g., player) leaves the Area2D
func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false
