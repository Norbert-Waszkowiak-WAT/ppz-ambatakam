extends Area2D

var speed = 400  # Prędkość pocisku
var direction = Vector2.ZERO

func _ready():
	# Ustaw kierunek pocisku na podstawie jego rotacji
	direction = Vector2.RIGHT.rotated(rotation)

func _physics_process(delta):
	# Poruszanie się pocisku
	position += direction * speed * delta

func _on_body_entered(body):
	if body.name == "CharacterBody2D":  # Kolizja z graczem
		print("Gracz trafiony!")
		queue_free()
