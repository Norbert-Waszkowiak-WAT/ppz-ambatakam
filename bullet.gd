extends Area2D

var speed = 400  # Prędkość pocisku
var direction = Vector2.ZERO

# Funkcja do ustawiania kierunku lotu pocisku
func set_direction(new_direction):
	direction = new_direction.normalized()

func _ready():
	# Jeżeli nie ustawiono kierunku, domyślnie lecimy w prawo
	if direction == Vector2.ZERO:
		direction = Vector2.RIGHT

func _physics_process(delta):
	# Ruch pocisku
	position += direction * speed * delta

func _on_body_entered(body):
	if body.name == "CharacterBody2D":  # Kolizja z graczem
		print("Gracz trafiony!")
		queue_free()  # Usunięcie pocisku
