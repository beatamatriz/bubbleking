extends Node2D

@export var GAME_TIMER = 5
@export var MASH_HP = 15

var active = false
var count = 0
var success = false

func _process(delta: float) -> void:
	if active:
		if active and Input.is_action_just_pressed("ui_accept"):
			count += 1
		if count >= MASH_HP:
			active = false
			success = true
			$Pulpa/AnimationPlayer.play("Bucle")
			$Bubble/AnimationPlayer.play("Final")
		elif count > 9 * MASH_HP/10:
			$Bubble.frame = 9
		elif count > 8 * MASH_HP/10:
			$Bubble.frame = 8
		elif count > 7 * MASH_HP/10:
			$Bubble.frame = 7
		elif count > 6 * MASH_HP/10:
			$Bubble.frame = 6
		elif count > 5 * MASH_HP/10:
			$Bubble.frame = 5
		elif count > 4 * MASH_HP/10:
			$Bubble.frame = 4
		elif count > 3 * MASH_HP/10:
			$Bubble.frame = 3
		elif count > 2 * MASH_HP/10:
			$Bubble.frame = 2
		elif count >= 1 * MASH_HP/10:
			$Bubble.frame = 1

func begin():
	active = true
	
	$Bubble.frame = 13
	$Pulpa/AnimationPlayer.play("Soplido")
	$Timer.start(GAME_TIMER)
	
func _on_timer_timeout() -> void:
	active = false
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")
