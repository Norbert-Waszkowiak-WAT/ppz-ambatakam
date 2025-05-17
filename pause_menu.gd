extends Control

func _ready():
	hide()  # Start hidden

func _process(delta):
	testEsc()

func testEsc():
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume()
		else:
			pause()

func pause():
	get_tree().paused = true
	show()  # Show the menu

func resume():
	get_tree().paused = false
	hide()  # Hide the menu

func _on_kont_pressed() -> void:
	resume()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_cred_pressed() -> void:
	get_tree().change_scene_to_file("res://credits.tscn")
