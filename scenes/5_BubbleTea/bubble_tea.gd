extends Node2D

@export var GAME_TIMER = 5

var total_tapio = 0
var count = 0
var success = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if count >= total_tapio:
		success = true

func begin():
	count = 0
	total_tapio = $TapioManager.get_children().size()
	$Timer.start(GAME_TIMER)

func end():
	get_parent().next()

func suck():
	count += 1
	

func _on_timer_timeout() -> void:
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")
