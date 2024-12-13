extends Node2D

var poziom: int = 0
var wynik: int = 0
var timer: float = 0
var gra_on: bool = false
var high_score: int = 0
var screen: int = 0
var spawnable_height := [72, 248, 392, 568]

var carred_scene: PackedScene = preload("res://autored.tscn")
var cargreen_scene: PackedScene = preload("res://autogreen.tscn")
var carcrimson_scene: PackedScene = preload("res://autocrimson.tscn")
var carwhite_scene: PackedScene = preload("res://autowhite.tscn")
var wrogieauta := [carred_scene, cargreen_scene, carcrimson_scene, carwhite_scene]

func _process(delta: float):
	if gra_on:
		var start = $HUDracer/startracerlabel
		start.visible = false
		timer += delta
		if timer >= 0.05:
			wynik += 1
			timer = 0

		if wynik % 500 == 0 and wynik != 0:
			poziom += 1

		poka_score()
		print(wynik)

	if Input.is_action_pressed("ui_select"):
		gra_on = true

func poka_score():
	var label = $HUDracer/wyniklabel
	label.text = "SCORE: " + str(wynik)

func rozmiar_ekran():
	screen = get_viewport().size
