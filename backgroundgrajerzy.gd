extends Node2D  # Or any parent node type where you are managing the sprites

# List of Sprite2D nodes (add these in the scene or dynamically)
@onready var sprites = $Sprites  # Assuming you have a container node with all Sprite2D nodes as children

# Scrolling speed (how fast the sprites move to the left)
var scroll_speed : float = 100  # Pixels per second

# Width of the screen (used for wrapping around when sprites move off-screen)
var screen_width : float
var sprite_width : float  # Width of each sprite to detect when it moves off-screen

func _ready():
	# Get the screen width from the viewport size
	screen_width = get_viewport().size.x
	
	# Check if there are any child nodes in the container
	if sprites.get_child_count() > 0:
		var first_sprite = sprites.get_child(0)
		
		# Ensure the first child is a Sprite2D and has a texture
		if first_sprite is Sprite2D and first_sprite.texture:
			sprite_width = first_sprite.texture.get_width()  # Get the width of the first sprite
		else:
			print("Error: The first child is not a Sprite2D or has no texture.")
	else:
		print("Error: No sprites found in the container.")

func _process(delta):
	# Loop through each sprite and move it left
	for sprite in sprites.get_children():
		if sprite is Sprite2D:  # Make sure it's a Sprite2D node
			sprite.position.x -= scroll_speed * delta  # Move sprite to the left
			
			# If the sprite has moved off the left side of the screen, reset its position
			if sprite.position.x <= -sprite_width:
				sprite.position.x += screen_width  # Move sprite back to the right side to loop
