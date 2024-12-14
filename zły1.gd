extends CharacterBody2D

# Zmienne
var speed = 450
var jump_force = -1100
var gravity = 3500

# Limity dla pozycji
var left_limit = -490  # lewa krawędź ekranu
var right_limit = 550  # prawa krawędź ekranu
var bottom_limit = 600  # dolna krawędź ekranu

func _physics_process(delta):
	# Dodanie grawitacji
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	# Ruch w lewo i prawo
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed

	# Ograniczenie pozycji w poziomie
	if position.x < left_limit:
		position.x = left_limit
	elif position.x > right_limit:
		position.x = right_limit

	# Skok (jak w Geometry Dash)
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		velocity.y = jump_force

	# Ograniczenie pozycji w pionie
	if position.y > bottom_limit:
		position.y = bottom_limit

	# Ruch
	move_and_slide()
