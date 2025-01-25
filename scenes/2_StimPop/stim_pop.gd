extends Node2D

@export var GAME_TIMER = 5
var pop_total = 0

var count = 0
var success = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if count >= pop_total:
		success = true

func begin():
	pop_total = 0
	for bubble in $PoppablesManager.get_children():
		pop_total += 1
		bubble.POPPED = false
	$Timer.start(GAME_TIMER)
	
func _on_timer_timeout() -> void:
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")
