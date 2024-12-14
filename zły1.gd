extends CharacterBody2D

# Zmienne
var speed = 350
var jump_force = -1200
var gravity = 3500

# Limity dla pozycji
var left_limit = -490  # lewa krawędź ekranu
var right_limit = 550  # prawa krawędź ekranu (przykład, dostosuj do szerokości swojego ekranu)

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

	# Skok
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force

	# Ruch
	move_and_slide()
# Limity dla pozycji w pionie
var bottom_limit = 600  # Przykład, dostosuj do wysokości swojego ekranu

func _physics1_process(delta):
	# Grawitacja i ruch w pionie
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	# Ograniczenie pozycji w pionie
	if position.y > bottom_limit:
		position.y = bottom_limit

	# Ruch w poziomie
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed

	# Skok
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force

	# Ruch
	move_and_slide()
