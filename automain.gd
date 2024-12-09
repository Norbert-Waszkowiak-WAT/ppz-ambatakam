extends CharacterBody2D  # Or Sprite2D, depending on your node type

# The amount to teleport (in pixels)
var teleport_distance : float = 100.0  # You can adjust this distance

func _process(delta):
	# Check if the 'ui_up' action is pressed (typically Up Arrow key or W key)
	if Input.is_action_just_pressed("ui_up"):
		teleport(Vector2(0, -teleport_distance))  # Move up by 'teleport_distance'

	# Check if the 'ui_down' action is pressed (typically Down Arrow key or S key)
	if Input.is_action_just_pressed("ui_down"):
		teleport(Vector2(0, teleport_distance))  # Move down by 'teleport_distance'

# Function to move the car (teleport the sprite) by a certain offset
func teleport(offset: Vector2):
	position += offset  # Adjust the car's position by the offset
