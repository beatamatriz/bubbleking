extends Node2D

@export var TRANSITION_TIME = 2
@export var HIT_POINTS = 3
const mgcount = 2
var mgl = [1, 2] # MicroGame List
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
		$Camera.position = $Keymash.position
		$Keymash.begin()

	if mgl[current_mg] == 2:
		$Camera.position = $Sudden.position
		$Sudden.begin()

func game_over():
	pass
