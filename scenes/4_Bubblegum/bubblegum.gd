extends Node2D

@export var GAME_TIMER = 5
@export var CHEW_TIMER = 0.8
@export var MASH_HP = 15

var active = false
var count = 0
var success = false

func _process(delta: float) -> void:
	if active:
		if Input.is_action_just_pressed("ui_accept"):
			count += 1
		if count >= MASH_HP:
			success = true

func begin():
	$Timer.start(GAME_TIMER)
	$ChewTimer.start(CHEW_TIMER)
	$Demonia/AnimationPlayer.play("Chew")
	
func _on_timer_timeout() -> void:
	active = false
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")


func _on_chew_timer_timeout() -> void:
	active = true
