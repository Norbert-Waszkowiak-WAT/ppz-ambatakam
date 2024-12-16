extends Node2D

var bullet_scene = preload("res://bullet.tscn")  # Załaduj scenę pocisku
var bullet_speed = 500  # Prędkość pocisku

func _ready():
	if $Timer != null:
		$Timer.start()
		$Timer.timeout.connect(_on_Timer_timeout)
	else:
		print("Błąd: Timer nie istnieje!")

func _on_Timer_timeout():
	_fire_bullet($Muzzle1)
	_fire_bullet($Muzzle2)

func _fire_bullet(muzzle):
	if muzzle != null:
		# Tworzenie pocisku
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		
		# Ustawianie pozycji pocisku na Muzzle
		bullet.global_position = muzzle.global_position
		
		# Obliczanie kierunku do obniżonego środka ekranu
		var center_screen = get_viewport_rect().size / 2
		center_screen.y += 200  # Obniżenie celu o 200 pikseli
		var direction = (center_screen - bullet.global_position).normalized()
		
		# Ustawienie kierunku pocisku
		bullet.set_direction(direction)
		
		# Ustawianie rotacji pocisku w kierunku celu
		bullet.rotation = direction.angle()
