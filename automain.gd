extends CharacterBody2D

# Position variables for teleportation
var pos1 : Vector2  # Position to teleport to when the up arrow is pressed
var pos2 : Vector2  # Position to teleport to when the down arrow is pressed

# Set default positions (you can adjust these as needed)
func _ready():
	pos1 = Vector2(192, 150)  # Position for teleporting up (example offset)
	pos2 = Vector2(192, -150)   # Position for teleporting down (example offset)

func _process(delta):
	# Check if the 'ui_up' action is pressed (typically Up Arrow key or W key)
	if Input.is_action_just_pressed("ui_up"):
		teleport(pos1)  # Teleport to pos1

	# Check if the 'ui_down' action is pressed (typically Down Arrow key or S key)
	if Input.is_action_just_pressed("ui_down"):
		teleport(pos2)  # Teleport to pos2

# Function to move the character to the given position
func teleport(target_position: Vector2):
	position = target_position  # Set the position to the target position
