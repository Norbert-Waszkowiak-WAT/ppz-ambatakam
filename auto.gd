
extends Node2D

var current_machine = null

func _ready():
	set_process(true)

func _process(delta):
	# Check if the 'E' key is pressed and the current machine is not null
	if current_machine and Input.is_action_just_pressed("ui_accept"):
		load_minigame()

	# Check if the "E" key is pressed
	if current_machine and Input.is_key_pressed(KEY_E):  # Or use `Input.is_action_just_pressed("e")` if you use the input map
		load_minigame()

# Load the corresponding minigame based on the machine name
func load_minigame():
	match current_machine.name:
		"Automat1":
			get_tree().change_scene("res://graj.tscn")  # Change scene to graj.tscn
		"Automat2":
			get_tree().change_scene_to_file("res://grai.tscn")
		"Automat3":
			get_tree().change_scene_to_file("res://Minigame3.tscn")

# When player enters the machine's area
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		current_machine = get_parent()

# When player exits the machine's area
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		current_machine = null


func _on_Area2D_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_Area2D_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
