extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
#ready var animation = $AnimationPlayer



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	var b := Input.get_axis("ui_up", "ui_down")
	if b:
		velocity.y = b * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
