extends Node2D

var bullet_scene = preload("res://bullet.tscn")  # Załaduj scenę pocisku
var bullet_speed = 500  # Prędkość pocisku

func _ready():
	if $Timer != null:
		$Timer.wait_time = 2.0  # Strzał co 2 sekundy
		$Timer.start()
		$Timer.timeout.connect(_on_Timer_timeout)
	else:
		print("Błąd: Timer nie istnieje!")

func _on_Timer_timeout():
	# Tworzenie pocisku
	var bullet = bullet_scene.instantiate()
	# Dodanie pocisku do głównej sceny
	get_parent().add_child(bullet)
	# Ustaw pozycję pocisku na pozycję Muzzle (Node2D)
	bullet.global_position = $Muzzle.global_position
	
	# Ustaw rotację pocisku na rotację armaty
	bullet.rotation = $Muzzle.global_rotation
	
	print("Pocisk wystrzelony z pozycji: ", bullet.global_position)
