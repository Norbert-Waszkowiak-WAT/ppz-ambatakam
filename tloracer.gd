extends Sprite2D  # Tells the script that it controls a Sprite2D node

# Speed at which the sprite moves (in pixels per second)
var speed : float = 100

# Called every frame
func _process(delta):
	# Move the sprite to the left every frame
	position.x -= speed * delta
	
	# If the sprite has gone off the left side of the screen, reset its position to the right
	if position.x <= -texture.get_width():
		position.x = get_viewport().size.x
