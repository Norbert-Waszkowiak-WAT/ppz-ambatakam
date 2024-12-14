extends Area2D

var speed = 500  # Prędkość pocisku
var direction = Vector2.ZERO  # Kierunek poruszania się pocisku

func _ready():
	# Ustaw kierunek poruszania się pocisku na podstawie jego obrotu
	direction = Vector2(cos(rotation), sin(rotation))
	$Timer.start(5.0)  # Uruchom Timer do usunięcia pocisku po 5 sekundach

func _physics_process(delta):
	# Poruszaj pocisk w określonym kierunku
	position += direction * speed * delta

func _on_Timer_timeout():
	# Usunięcie pocisku po upływie czasu
	queue_free()

func _on_body_entered(body):
	# Reakcja na kolizję z graczem
	if body.name == "CharacterBody2D":
		print("Gracz trafiony!")  # Komunikat w konsoli
		queue_free()  # Usuń pocisk
