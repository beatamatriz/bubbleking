extends Node2D

@export var TRANSITION_TIME = 0.5
@export var HIT_POINTS = 3
const mgcount = 3
var mgl = [2, 4, 5, 7, 9, 11] # MicroGame List
var current_mg = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func initialize():
	mgl.shuffle()
	current_mg = -1
	
	# Animación de begin
	next("Default")

func next(state):
	if state == "Default":
		$TransitionTimer.start(2)
	elif state == "Success":
		$Camera/Success.visible = true
		$TransitionTimer.start(2)
	elif state == "Failure":
		HIT_POINTS -= 1
		if (HIT_POINTS == 0):
			game_over()
		$Camera/Failure.visible = true
		$TransitionTimer.start(2)

func _on_transition_timer_timeout() -> void:
	$Camera/Success.visible = false
	$Camera/Failure.visible = false
	current_mg += 1
	if mgl[current_mg] == 1:
		pass
	if mgl[current_mg] == 2:
		$Camera.position = $Two.position
		$Two.begin()
	if mgl[current_mg] == 3:
		pass
	if mgl[current_mg] == 4:
		$Camera.position = $Four.position
		$Four.begin()
	if mgl[current_mg] == 5:
		$Camera.position = $Five.position
		$Five.begin()
	if mgl[current_mg] == 6:
		pass
	if mgl[current_mg] == 7:
		$Camera.position = $Seven.position
		$Seven.begin()
	if mgl[current_mg] == 8:
		pass
	if mgl[current_mg] == 9:
		$Camera.position = $Nine.position
		$Nine.begin()
	if mgl[current_mg] == 10:
		pass
	if mgl[current_mg] == 11:
		$Camera.position = $Eleven.position
		$Eleven.begin()
	if mgl[current_mg] == 12:
		pass

func game_over():
	pass
