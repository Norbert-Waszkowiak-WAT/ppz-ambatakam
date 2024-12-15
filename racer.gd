extends Node2D

var poziom: int = 0
var wynik: int = 0
var timer: float = 0
var gra_on: bool = false
var high_score: int = 0
var screen: Vector2
var spawnable_height := [45, 210, 350, 530]
var motor_height := [140,460]
@onready var crash = $AudioStreamPlayer2D2

var carred_scene: PackedScene = preload("res://autored.tscn")
var cargreen_scene: PackedScene = preload("res://autogreen.tscn")
var carcrimson_scene: PackedScene = preload("res://autocrimson.tscn")
var carwhite_scene: PackedScene = preload("res://autowhite.tscn")
var motorenemy: PackedScene = preload("res://motorenemy.tscn")
var wrogieauta := [carred_scene, cargreen_scene, carcrimson_scene, carwhite_scene]
var spawned_cars = []
var zajy = []

func _ready():
	screen = get_viewport().size
	$Gameover.get_node("Button").pressed.connect(nowa_gra)
	nowa_gra()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		load_scene()

func load_scene():
	var scene_path = "res://main.tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		print("Failed to load scene 'main.tscn'. Scene does not exist.")



func _process(delta: float):
	if gra_on:
		timer += delta
		if timer >= 0.05:
			wynik += 1
			timer = 0
		if wynik % 500 == 0 and wynik != 0:
			poziom += 1
		poka_score()
	else:
		$Gameover/Button.hide()
		$Gameover/Label.hide()
		$Gameover/Label2.hide()
		if Input.is_action_pressed("ui_select"):
			gra_on = true
			$HUDracer/startracerlabel.hide()

func poka_score():
	var label = $HUDracer/wyniklabel
	label.text = "SCORE: " + str(wynik)

func sprawdz_high_score():
	if wynik > high_score:
		high_score = wynik
		$HUDracer.get_node("najwyniklabel").text = "HIGH SCORE: " + str(high_score)

func nowa_gra():
	wynik = 0
	poka_score()
	poziom = 0
	timer = 0
	gra_on = false
	get_tree().paused = false
	$auto.position = Vector2(0, 0)
	
   
	for car in spawned_cars:
		if car:
			if car != null:
				car.queue_free()
	spawned_cars.clear()
	$HUDracer.get_node("startracerlabel").show()
	$Gameover/Button.hide()
	$Gameover/Label.hide()
	$Gameover/Label2.hide()

func _on_timermotor_timeout() -> void:
	if gra_on:
		var motor = motorenemy.instantiate()
		var motor_y = motor_height[randi() % motor_height.size()]
		var motor_x = screen.x + 100
		motor.body_entered.connect(wypadek)
		add_child(motor)
		motor.position = Vector2(motor_x, motor_y)
		motor.speed = 500 + (poziom * 10)
		spawned_cars.append(motor)

func _on_timer_timeout() -> void:
	if gra_on:
		var liczba_aut = randi() % 3 + 1
		for i in range(liczba_aut):
			var car_scene = wrogieauta[randi() % wrogieauta.size()]
			var car = car_scene.instantiate()
			var car_y = pozycje()
			var car_x = screen.x + 100
			car.body_entered.connect(wypadek)
			add_child(car)
			car.position = Vector2(car_x, car_y)
			car.speed = 300 + (poziom * 10)
			spawned_cars.append(car)
			zajy.append(car_y)

func pozycje() -> int:
	var wolney = spawnable_height.duplicate()
	for zajete in zajy:
		if zajete in wolney:
			wolney.erase(zajete)
	if wolney.size() > 0:
		return wolney[randi() % wolney.size()]
	else:
		return spawnable_height[randi() % spawnable_height.size()]
		
func wypadek(body: Node2D) -> void:
	if body.name == "auto":
		crash.play()
		game_over()
		

func koniec_wynik():
	$Gameover.get_node("Label").text = "  TWÓJ WYNIK: " + "\n" + str(wynik) + "\n" + "NAJLEPSZY WYNIK: " + "\n" + str(high_score)

func game_over():
	get_tree().paused = true
	sprawdz_high_score()
	gra_on = false
	$Gameover/Button.show()
	$Gameover/Label.show()
	$Gameover/Label2.show()
	koniec_wynik()
