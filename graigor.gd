extends Node2D  # Lub inny typ węzła nadrzędnego

func change_scene():
	var scene_path = "res://grai.tscn"  # Ścieżka do sceny
	if ResourceLoader.exists("res://grai.tscn"):  # Sprawdź, czy scena istnieje
		get_tree().change_scene_to_file("res://grai.tscn")  # Przejdź do nowej sceny
	else:
		print("Scena nie istnieje:", "res://grai.tscn")

func _input(event):
	# Sprawdź, czy akcja "change_scene" została aktywowana
	if event.is_action_pressed("grai"):
		change_scene()
