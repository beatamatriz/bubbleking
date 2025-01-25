extends Node2D

@export var TRANSITION_TIME = 1
@export var HIT_POINTS = 3
var mgl = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] # MicroGame List
var current_mg = 0

func _ready() -> void:
	initialize()

func initialize():
	$Camera/Failure.visible = false
	$Camera/Success.visible = false
	$Camera/GameOver.visible = false
	mgl.shuffle()
	current_mg = -1
	
	# Animación de begin
	next("Default")

func next(state):
	current_mg += 1
	if current_mg >= mgl.size():
		state = "Boss"
	if state == "Boss":
		boss()
	elif state == "Default":
		$TransitionTimer.start(TRANSITION_TIME)
	elif state == "Success":
		$Camera/Success.visible = true
		$TransitionTimer.start(TRANSITION_TIME)
	elif state == "Failure":
		HIT_POINTS -= 1
		if (HIT_POINTS == 0):
			game_over()
		$Camera/Failure.visible = true
		$TransitionTimer.start(TRANSITION_TIME)

func _on_transition_timer_timeout() -> void:
	$Camera/Success.visible = false
	$Camera/Failure.visible = false
	if mgl[current_mg] == 1:
		next("Default")
	if mgl[current_mg] == 2:
		$Camera.position = $Two.position
		$Two.begin()
	if mgl[current_mg] == 3:
		next("Default")
	if mgl[current_mg] == 4:
		$Camera.position = $Four.position
		$Four.begin()
	if mgl[current_mg] == 5:
		$Camera.position = $Five.position
		$Five.begin()
	if mgl[current_mg] == 6:
		next("Default")
	if mgl[current_mg] == 7:
		$Camera.position = $Seven.position
		$Seven.begin()
	if mgl[current_mg] == 8:
		next("Default")
	if mgl[current_mg] == 9:
		$Camera.position = $Nine.position
		$Nine.begin()
	if mgl[current_mg] == 10:
		next("Default")
	if mgl[current_mg] == 11:
		$Camera.position = $Eleven.position
		$Eleven.begin()
	if mgl[current_mg] == 12:
		next("Default")

func boss():
	pass

func game_over():
	$Camera/GameOver.visible = true
