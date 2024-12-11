extends Area2D

var speed : int = 200  # Default speed

func _ready():
	pass  # Additional setup if needed

func _process(delta):
	# Move the car leftward each frame
	position.x -= speed * delta

	# If the car is off-screen, remove it
	if position.x < -100:
		queue_free()
