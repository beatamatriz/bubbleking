extends Node2D

@export var GAME_TIMER = 5
@export var SUDDEN_TIME = 2
@export var HIT_WINDOW = 0.5

var active = false
var is_hitwindow = false
var success = false

func _process(delta: float) -> void:
	if active:
		if Input.is_action_just_pressed("ui_accept") and is_hitwindow:
			success = true
			$Win.visible = true

func _on_hw_begin_timeout() -> void:
	is_hitwindow = true

func _on_hw_end_timeout() -> void:
	is_hitwindow = false
	$Lose.visible = true

func begin():
	active = true
	$Timer.start(GAME_TIMER)
	$Samurai/AnimationPlayer.play("Unsheath")
	$Usurper/AnimationPlayer.play("Unsheath")
	$HWBegin.start(SUDDEN_TIME)
	$HWEnd.start(SUDDEN_TIME + HIT_WINDOW)

func _on_timer_timeout() -> void:
	if active:
		active = false
		if success:
			get_parent().next("Success")
		else:
			get_parent().next("Failure")
