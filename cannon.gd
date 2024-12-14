extends Node2D

var bullet_scene = preload("res://bullet.tscn")  # Wczytanie sceny pocisku
var fire_rate = 2.0  # Czas pomiędzy strzałami (w sekundach)

func _ready():
	# Konfiguracja Timera dla strzałów
	$Timer.wait_time = fire_rate  # Ustaw czas między strzałami
	$Timer.start()  # Uruchom Timer

func _on_Timer_timeout():
	# Funkcja wywoływana co zakończenie Timera - strzelanie pociskiem
	var bullet = bullet_scene.instantiate()  # Stwórz instancję pocisku
	bullet.position = global_position  # Ustaw początkową pozycję pocisku (miejsce armaty)
	bullet.rotation = rotation  # Ustaw pocisk zgodnie z obrotem armaty
	get_parent().add_child(bullet)  # Dodaj pocisk do sceny głównej
