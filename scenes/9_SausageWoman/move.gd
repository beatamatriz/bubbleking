extends Node2D

@export var GAME_TIMER = 5

var success = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func begin():
	$Timer.start(GAME_TIMER)

func end():
	get_parent().next()

func failure():
	success = false
	$MujerSalchicha.die()

func _on_timer_timeout() -> void:
	if success:
		get_parent().next("Success")
	else:
		get_parent().next("Failure")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MujerSalchicha":
		success = true
