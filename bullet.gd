extends Area2D

var speed = 500  # Prędkość pocisku
var direction = Vector2.ZERO  # Kierunek pocisku

func _ready():
	direction = Vector2(cos(rotation), sin(rotation))  # Ustaw kierunek pocisku na podstawie rotacji

func _physics_process(delta):
	position += direction * speed * delta  # Ruch pocisku w zadanym kierunku

func _on_body_entered(body):
	if body.name == "CharacterBody2D":  # Kolizja z graczem
		print("Gracz trafiony!")  # Komunikat
		queue_free()  # Usunięcie pocisku
