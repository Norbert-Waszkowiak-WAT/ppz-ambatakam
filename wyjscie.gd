extends Node

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		load_scene()

func load_scene():
	var scene_path = "res://main.tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		print("Failed to load scene 'main.tscn'. Scene does not exist.")
