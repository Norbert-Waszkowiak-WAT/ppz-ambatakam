extends CharacterBody2D

const SPEED = 300.0

@onready var sprite = $Sprite2D  # Adjust if your node is named differently

func _physics_process(delta: float) -> void:
	var directionx = Input.get_axis("ui_left", "ui_right")
	var directiony = Input.get_axis("ui_up", "ui_down")

	# Flip sprite based on horizontal movement (reversed logic)
	if directionx != 0:
		sprite.flip_h = directionx > 0  # flip when moving right

	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

	if directionx != 0 or directiony != 0:
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.stop()
