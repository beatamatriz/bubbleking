extends Node2D

@export var GAME_TIMER = 5
var pop_total = 0

var active = false
var count = 0
var success = false

func _process(delta: float) -> void:
	if active and count >= pop_total:
		success = true

func begin():
	active = true
	pop_total = 0
	for bubble in $PoppablesManager.get_children():
		pop_total += 1
		bubble.POPPED = false
	$Timer.start(GAME_TIMER)
	
func _on_timer_timeout() -> void:
	if active:
		active = false
		if success:
			get_parent().next("Success")
		else:
			get_parent().next("Failure")
