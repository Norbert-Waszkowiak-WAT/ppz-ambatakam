extends Node2D

var bullet_scene = preload("res://bullet.tscn")  # Wczytanie pocisku
var fire_rate = 2  # Czas pomiędzy strzałami
var bullet_speed = 500  # Prędkość pocisków

func _ready():
	# Konfiguracja Timera
	$Timer.wait_time = fire_rate  # Ustaw czas pomiędzy strzałami
	$Timer.start()  # Rozpocznij timer

# Funkcja wywołana przez timer
func _on_Timer_timeout():
	# Tworzenie pocisku i dodawanie go do sceny głównej
	var bullet = bullet_scene.instantiate()  # Utwórz instancję pocisku
	bullet.position = position  # Ustawienie pozycji pocisku w miejscu armatki
	bullet.rotation = rotation  # Ustaw obrót pocisku zgodnie z armatką
	bullet.speed = bullet_speed  # Przekazanie prędkości pocisku
	get_parent().add_child(bullet)  # Dodanie pocisku do sceny

func _on_timer_timeout() -> void:
	pass # Replace with function body.
