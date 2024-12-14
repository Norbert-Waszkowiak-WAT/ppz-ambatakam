extends Area2D

var speed : int = 200
signal wypadek()

func _process(delta):
		position.x -= speed * delta
		if position.x < -100:
			queue_free()
