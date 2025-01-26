extends Node2D

@export var GAME_TIMER = 5
@export var SUDDEN_TIME = 2
@export var HIT_WINDOW = 0.5
@export var DOLLARS = 0

var active = false
var is_hitwindow = false
var success = false

func _process(delta: float) -> void:
	if active:
		$Screen/Label.text = DOLLARS
		if Input.is_action_just_pressed("ui_accept") and is_hitwindow:
			$Screen/AnimationPlayer.pause()
			success = true

func _on_hw_begin_timeout() -> void:
	is_hitwindow = true

func _on_hw_end_timeout() -> void:
	is_hitwindow = false

func begin():
	active = true
	$Timer.start(GAME_TIMER)
	$Screen/AnimationPlayer.play("Move")
	$HWBegin.start(SUDDEN_TIME)
	$HWEnd.start(SUDDEN_TIME + HIT_WINDOW)

func _on_timer_timeout() -> void:
	if active:
		active = false
		if success:
			get_parent().next("Success")
		else:
			get_parent().next("Failure")
