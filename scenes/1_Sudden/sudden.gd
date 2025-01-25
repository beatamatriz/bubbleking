extends Node2D

@export var GAME_TIMER = 5
@export var SUDDEN_TIME = 2
@export var HIT_WINDOW = 0.5

var is_hitwindow = false
var success = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_hitwindow:
		success = true
		$SpriteB.visible = true

func _on_hw_begin_timeout() -> void:
	$SpriteA.visible = true
	is_hitwindow = true

func _on_hw_end_timeout() -> void:
	$SpriteA.visible = false
	is_hitwindow = false

func begin():
	$Timer.start(GAME_TIMER)
	$HWBegin.start(SUDDEN_TIME)
	$HWEnd.start(SUDDEN_TIME + HIT_WINDOW)

func end():
	get_parent().next()
	
func _on_timer_timeout() -> void:
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")
