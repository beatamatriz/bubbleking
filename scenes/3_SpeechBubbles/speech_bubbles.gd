extends Node2D

@export var GAME_TIMER = 5
@export var BUBBLE_COUNT = 1

var count = 0
var success = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if count >= BUBBLE_COUNT:
		success = true

func begin():
	for speech_bubble in $SpeechBubbleManager.get_children():
		speech_bubble.locked = false
	$Timer.start(GAME_TIMER)
	
func _on_timer_timeout() -> void:
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")
