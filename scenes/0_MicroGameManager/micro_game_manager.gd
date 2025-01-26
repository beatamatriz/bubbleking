extends Node2D

@export var TRANSITION_TIME = 1.0
@export var HIT_POINTS = 3

# var mgl = [2, 2]
var mgl = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12] # MicroGame List

var current_mg = 0

var ost_volume = -5

func _ready() -> void:
	initialize()

func _process(delta: float) -> void:
	update_hp()

func initialize():
	$Camera/Failure.visible = false
	$Camera/Success.visible = false
	$Camera/GameOver.visible = false
	mgl.shuffle()
	current_mg = -1
	HIT_POINTS = 3
	# Animación de begin
	next("Default")

func update_hp():
	if HIT_POINTS < 3:
		$Camera/UsurperHP/HP3.visible = false
	if HIT_POINTS < 2:
		$Camera/UsurperHP/HP2.visible = false
	if HIT_POINTS < 1:
		$Camera/UsurperHP/HP1.visible = false

func next(state):
	mute(current_mg)
	current_mg += 1
	if state == "Default":
		$TransitionTimer.start(TRANSITION_TIME)
	elif state == "Success":
		$Camera/sfx_success.play()
		$Camera/Success.visible = true
		$TransitionTimer.start(TRANSITION_TIME)
	elif state == "Failure":
		print(HIT_POINTS)
		$Camera/sfx_fail.play()
		HIT_POINTS -= 1
		if (HIT_POINTS == 0):
			game_over()
			return
		$Camera/Failure.visible = true
		$TransitionTimer.start(TRANSITION_TIME)
	$Camera.position = Vector2(0, 0)
	
func mute(mg: int):
	if mgl[mg] == 1:
		$Camera/layer1.volume_db = -80
	if mgl[mg] == 2:
		$Camera/layer2.volume_db = -80
	if mgl[mg] == 3:
		$Camera/layer3.volume_db = -80
	if mgl[mg] == 4:
		$Camera/layer4.volume_db = -80
	if mgl[mg] == 5:
		$Camera/layer5.volume_db = -80
	if mgl[mg] == 6:
		$Camera/layer6.volume_db = -80
	if mgl[mg] == 7:
		$Camera/layer7.volume_db = -80
	if mgl[mg] == 8:
		$Camera/layer8.volume_db = -80
	if mgl[mg] == 9:
		$Camera/layer9.volume_db = -80
	if mgl[current_mg] == 10:
		$Camera/layer10.volume_db = -80
	if mgl[mg] == 11:
		$Camera/layer11.volume_db = -80
	if mgl[mg] == 12:
		$Camera/layer12.volume_db = -80
	

func _on_transition_timer_timeout() -> void:
	if current_mg >= mgl.size():
		boss()
	elif mgl[current_mg] == 1:
		$Camera/layer1.volume_db = ost_volume
		$Camera.position = $One.position
		$One.begin()
	elif mgl[current_mg] == 2:
		$Camera/layer2.volume_db = ost_volume
		$Camera.position = $Two.position
		$Two.begin()
	elif mgl[current_mg] == 3:
		$Camera/layer3.volume_db = ost_volume
		$Camera.position = $Three.position
		$Three.begin()
	elif mgl[current_mg] == 4:
		$Camera/layer4.volume_db = ost_volume
		$Camera.position = $Four.position
		$Four.begin()
	elif mgl[current_mg] == 5:
		$Camera/layer5.volume_db = ost_volume
		$Camera.position = $Five.position
		$Five.begin()
	elif mgl[current_mg] == 6:
		$Camera/layer6.volume_db = ost_volume
		$Camera.position = $Six.position
		$Six.begin()
	elif mgl[current_mg] == 7:
		$Camera/layer7.volume_db = ost_volume
		$Camera.position = $Seven.position
		$Seven.begin()
	elif mgl[current_mg] == 8:
		$Camera/layer8.volume_db = ost_volume
		$Camera.position = $Eight.position
		$Eight.begin()
	elif mgl[current_mg] == 9:
		$Camera/layer9.volume_db = ost_volume
		$Camera.position = $Nine.position
		$Nine.begin()
	elif mgl[current_mg] == 10:
		$Camera/layer10.volume_db = ost_volume
		$Camera.position = $Ten.position
		$Ten.begin()
	elif mgl[current_mg] == 11:
		$Camera/layer11.volume_db = ost_volume
		$Camera.position = $Eleven.position
		$Eleven.begin()
	elif mgl[current_mg] == 12:
		$Camera/layer12.volume_db = ost_volume
		$Camera.position = $Twelve.position
		$Twelve.begin()
	$Camera/Success.visible = false
	$Camera/Failure.visible = false

func boss():
	# Globals.USURPER_HP = HIT_POINTS
	get_tree().change_scene_to_file("res://scenes/13_BoubbleKing/BubbleKing.tscn")

func game_over():
	$Camera.position = Vector2(0, 0)
	$Camera/GameOver.visible = true
