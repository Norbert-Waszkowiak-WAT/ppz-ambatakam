extends Area2D

var speed = 500  # Prędkość pocisku
var direction = Vector2.ZERO  # Kierunek pocisku

func _ready():
	# Pocisk musi poruszać się od razu, po ustawieniu pozycji.
	direction = Vector2(cos(rotation), sin(rotation))  # Ustaw kierunek zgodnie z obrotem armatki
	$Timer.start(5.0)  # Timer usuwający pocisk po 5 sekundach

func _physics_process(delta):
	# Ruch pocisku
	position += direction * speed * delta

func _on_Timer_timeout():
	queue_free()  # Usunięcie pocisku po czasie

# Funkcja kolizji z graczem
func _on_body_entered(body):
	if body.name == "CharacterBody2D":  # Jeśli kolizja z graczem
		print("Gracz trafiony!")  # Na razie komunikat
		queue_free()  # Usunięcie pocisku


func _on_ready() -> void:
	pass # Replace with function body.
