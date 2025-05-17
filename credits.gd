extends Button

@onready var honk = $"FnafNoseHonk-MemeEffectSound"

func _pressed() -> void:
	honk.play()
