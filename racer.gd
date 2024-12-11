extends Node2D

var wynik = 0  
var timer = 0 
var spawn_timer = 0  # Timer to spawn cars more frequently (e.g., every 3 seconds)
var game_running = false
var high_score : int

var carred_scene = preload("res://autored.tscn")
var cargreen_scene = preload("res://autogreen.tscn")
var carcrimson_scene = preload("res://autocrimson.tscn")
var carwhite_scene = preload("res://autowhite.tscn")

var car_height := [125, 225, 400, 550]
var poziom = 0
var screen_size : Vector2
var typy_aut := [carred_scene, cargreen_scene, carwhite_scene, carcrimson_scene]
var obstacles : Array = []  # Initialize obstacles array

func _ready():
	# Get screen size when the scene is ready
	screen_size = get_viewport().size

func _process(delta):
	if game_running: 
		timer += delta
		
		# Update score every 0.05 seconds
		if timer >= 0.05:
			wynik += 1 
			timer = 0
		show_score()

		# Increment level when score reaches multiples of 500
		if wynik % 500 == 0:
			poziom += 1

		# Handle car spawning more frequently
		spawn_timer += delta
		if spawn_timer >= 3 - (poziom * 0.5):  # Spawn cars more frequently as the level increases
			spawn_timer = 0
			generate_cars()

	if Input.is_action_pressed("ui_select"):
		game_running = true
		new_game()  

# New game setup
func new_game():
	poziom = 0
	wynik = 0 
	timer = 0 
	spawn_timer = 0
	obstacles.clear()  # Clear any obstacles from the previous game
	show_score() 
	
	# Get RestartButton node and hide it
	var restart_button = $CanvasLayer.get_node_or_null("RestartButton")
	if restart_button:
		restart_button.hide()  # Hide the restart button if it exists

# Function to generate cars more frequently
func generate_cars():
	# Increase the number of cars based on the level (3 + poziom)
	var number_of_cars = 3 + poziom  # Start with 3 cars, add 1 more car per level

	for i in range(number_of_cars):
		# Choose a random car type from the list of car scenes
		var car_scene = typy_aut[randi() % typy_aut.size()]
		var car = car_scene.instantiate()  # Instantiate a new car scene
		
		# Set a random Y position from the predefined car heights
		# This ensures that cars spawn at random vertical positions
		var car_y = car_height[randi() % car_height.size()]
		
		# Set the car's initial X position off-screen on the right
		var car_x = screen_size.x + 100  # Off-screen right (just outside the screen)
		
		# Add the car to the scene and initialize its position
		add_child(car)
		car.position = Vector2(car_x, car_y)

		# Set car's speed (it will move leftward)
		# Base speed is 300, increasing by 20 per level
		car.speed = 300 + (poziom * 20)  # Speed increases with level

		# Add car to the obstacles list for potential future removal or collision checks
		obstacles.append(car)


func game_over():
	check_high_score()
	get_tree().paused = true
	game_running = false
	$GameOver.show()
	
	# Get RestartButton node and show it when the game is over
	var restart_button = $CanvasLayer.get_node_or_null("RestartButton")
	if restart_button:
		restart_button.show()  # Show the restart button if it exists

# Function to remove obstacles (cars) from the scene
func remove_obs(obs):
	obs.queue_free()
	obstacles.erase(obs)

# Collision detection logic
func hit_obs(body):
	if body.name == "Dino":
		game_over()

# Display the score on the HUD
func show_score():
	var label = $HUDracer/wyniklabel
	label.text = "SCORE: " + str(wynik)
	
# Handle high score logic (this needs the high_score variable)
func check_high_score():
	if wynik > high_score:  # Assuming `high_score` is defined somewhere
		high_score = wynik
		$HUD.get_node("HighScoreLabel").text = "HIGH SCORE: " + str(high_score)
