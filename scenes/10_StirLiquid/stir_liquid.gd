extends Node2D

@export var GAME_TIMER = 5.0
@export var CIRCLE_COUNT = 15

var active = false
var count = 0
var success = false

func _process(delta: float) -> void:
	if count >= CIRCLE_COUNT:
		success = true

func begin():
	active = true
	$Timer.start(GAME_TIMER)
	$Stir/background.play()
	
func _on_timer_timeout() -> void:
	if active:
		active = false
		if success:
			get_parent().next("Success")
		else:
			get_parent().next("Failure")
