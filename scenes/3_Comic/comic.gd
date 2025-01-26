extends Node2D

@export var GAME_TIMER = 2.5
@export var BUBBLE_COUNT = 1

var active
var count = 0
var success = false

func _process(delta: float) -> void:
	if active and count >= BUBBLE_COUNT:
		success = true

func begin():
	active = true
	$Timer.start(GAME_TIMER)
	
func _on_timer_timeout() -> void:
	active = false
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")
