extends Node2D

var wynik = 0  # The score variable
var timer = 0  # Timer to count seconds
var game_running = false  # Correct initialization of game_running

# Called every frame
func _process(delta):
	if game_running: 
		timer += delta  # Increase timer by the time passed since last frame
		
		# Check if 0.5 seconds have passed
		if timer >= 0.5:
			wynik += 10  # Increase score by 10
			timer = 0  # Reset the timer to start counting for the next 0.5 seconds
		
		# Call the function to update the score display
		show_score()
	else:
		# If the game isn't running, start the game when the player presses the select button
		if Input.is_action_pressed("ui_select"):
			game_running = true
			new_game()  # Reset the game and start the new game

# Function to start a new game
func new_game():
	# Reset variables
	wynik = 0  # Reset the score to 0
	timer = 0  # Reset the timer
	show_score()  # Update the score on the screen
	
	# Hide the start label and show it when the game is running
	$HUDracer.get_node("startracerlabel").hide()  # Hide the label when the game starts

# Function to update and show the score
func show_score():
	# Ensure HUDracer node exists and contains a Label named 'wyniklabel'
	var label = $HUDracer/wyniklabel
	label.text = "SCORE: " + str(wynik)
