extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var directionx = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var directiony = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
   
	if directionx > 0:
		velocity.x = directionx * SPEED
	elif directionx < 0:
		velocity.x = directionx * SPEED / 2
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if directiony != 0:
		velocity.y = directiony * SPEED / 1.5
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
