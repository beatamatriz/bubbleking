extends Node2D

@export var GAME_TIMER = 5.0

var active = false
var success = false

func begin():
	active = true
	$Timer.start(GAME_TIMER)

func _on_timer_timeout() -> void:
	if active:
		active = false
		if success:
			get_parent().next("Success")
		else:
			get_parent().next("Failure")


func _on_pompa_body_entered(body: Node2D) -> void:
	if active and body.name == "Erizo":
		success = true
		$Erizo/Sprite.frame = 1
		$Pompa.visible = false
