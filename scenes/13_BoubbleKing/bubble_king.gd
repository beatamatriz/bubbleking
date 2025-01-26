extends Node2D

@export var KING_TIME = 2.0
@export var WINDOW_TIME = 0.5


var pool = [1, 2, 3, 3, 2, 1, 1, 3, 2, 2, 1, 3, 2, 3, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3]
var round = -1
var choice = 0

func _ready() -> void:
	pool.shuffle()
	begin_round()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()

func get_input():
	if Input.is_action_pressed("rock"):
		choice = 1
	elif Input.is_action_pressed("paper"):
		choice = 2
	elif Input.is_action_pressed("siccors"):
		choice = 3

func begin_round():
	round += 1
	if round > 0:
		$King/ReyPiedra.visible = false
		$King/ReyPapel.visible = false
		$King/ReyTijera.visible = false
		$Usurper/JugadorPiedra.visible = false
		$Usurper/JugadorPapel.visible = false
		$Usurper/JugadorTijera.visible = false
	$KingTimer.start(KING_TIME)

func _on_king_timer_timeout() -> void:
	if pool[round] == 1:
		$King/ReyPiedra.visible = true
	if pool[round] == 2:
		$King/ReyPapel.visible = true
	if pool[round] == 3:
		$King/ReyTijera.visible = true
	$WindowTimer.start(WINDOW_TIME)

func _on_window_timer_timeout() -> void:
	if choice == 1:
		$Usurper/JugadorPiedra.visible = true
	elif choice == 2:
		$Usurper/JugadorPapel.visible = true
	elif choice == 3:
		$Usurper/JugadorTijera.visible = true
	$KingTimer.start(KING_TIME)
