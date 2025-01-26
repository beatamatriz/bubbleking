extends Node2D

@export var GAME_TIMER = 5.0
@export var CIRCLE_COUNT = 15

var active = false
var count = 0
var success = false

func _process(delta: float) -> void:
	if count >= CIRCLE_COUNT:
		success = true
	elif count > 6 * CIRCLE_COUNT / 7:
		$Stir/Sprite.frame = 6
	elif count > 5 * CIRCLE_COUNT / 7:
		$Stir/Sprite.frame = 5
	elif count > 4 * CIRCLE_COUNT / 7:
		$Stir/Sprite.frame = 4
	elif count > 3 * CIRCLE_COUNT / 7:
		$Stir/Sprite.frame = 3
	elif count > 2 * CIRCLE_COUNT / 7:
		$Stir/Sprite.frame = 2
	elif count > CIRCLE_COUNT / 7:
		$Stir/Sprite.frame = 1
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
