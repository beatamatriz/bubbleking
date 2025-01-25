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
			$SpriteB.visible = true

func _on_hw_begin_timeout() -> void:
	$SpriteA.visible = true
	is_hitwindow = true

func _on_hw_end_timeout() -> void:
	$SpriteA.visible = false
	is_hitwindow = false

func begin():
	active = true
	$Timer.start(GAME_TIMER)
	$HWBegin.start(SUDDEN_TIME)
	$HWEnd.start(SUDDEN_TIME + HIT_WINDOW)

func _on_timer_timeout() -> void:
	active = false
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")
