extends Node2D

var current_machine = null

func _ready():
	set_process(true)

func _process(delta):
	if current_machine and Input.is_action_just_pressed("ui_accept"):
		load_minigame()

	

	

func load_minigame():
	match current_machine.name:
		"Automat1":
			get_tree().change_scene("res://Minigame1.tscn")
		"Automat2":
			get_tree().change_scene("res://Minigame2.tscn")
		"Automat3":
			get_tree().change_scene("res://Minigame3.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		current_machine = get_parent()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		current_machine = null
