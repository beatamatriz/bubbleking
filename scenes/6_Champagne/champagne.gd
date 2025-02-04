extends Node2D

@export var GAME_TIMER = 5.0
@export var SHAKE_COUNT = 50

var active = false
var count = 0
var success = false

func _process(delta: float) -> void:
	if active and count >= SHAKE_COUNT:
		$Bottle/Sprite.frame = 1
		success = true

func begin():
	active = true
	$Bottle.begin()
	$Timer.start(GAME_TIMER)
	
func _on_timer_timeout() -> void:
	if active:
		active = false
		if success:
			get_parent().next("Success")
		else:
			get_parent().next("Failure")
