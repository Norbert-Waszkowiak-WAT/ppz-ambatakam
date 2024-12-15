extends Node2D

var bullet_scene = preload("res://bullet.tscn")  # Załaduj scenę pocisku
var bullet_speed = 500  # Prędkość pocisku
var muzzlex = 160
var muzzley = -64

func _ready():
	# Sprawdź, czy węzeł Timer istnieje i ustaw go na strzały co 2 sekundy
	if $Timer != null:
		$Timer.wait_time = 2.0  # Czas pomiędzy strzałami
		$Timer.start()  # Rozpocznij timer
		$Timer.timeout.connect(_on_Timer_timeout)  # Połącz sygnał timeout z funkcją
	else:
		print("Błąd: Timer nie istnieje!")

func _on_Timer_timeout():
	# Utwórz pocisk
	var bullet = bullet_scene.instantiate()  # Utwórz nową instancję pocisku
	add_child(bullet)  # Dodaj pocisk do głównej sceny
	bullet.position = Vector2(muzzlex, muzzley)  # Ustaw pozycję pocisku na pozycję węzła Muzzle
	bullet.rotation = rotation  # Ustaw rotację pocisku na rotację armaty
	bullet.speed = bullet_speed  # Ustaw prędkość pocisku
	
	print("Pocisk utworzony w pozycji: ", bullet.position)  # Debugowanie
