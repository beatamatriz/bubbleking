extends Node2D

@export var GAME_TIMER = 5
@export var MASH_HP = 15

var active = false
var count = 0
var success = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		if Input.is_action_just_pressed("ui_accept"):
			count += 1
		if count >= MASH_HP:
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
