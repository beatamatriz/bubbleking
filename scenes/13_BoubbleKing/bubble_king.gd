extends Node2D

@export var KING_TIME = 5
@export var WINDOW_TIME = 1


var pool = [1, 2, 3, 3, 2, 1, 1, 3, 2, 2, 1, 3, 2, 3, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3]
var round = -1
var choice = 0
var usurper_hp = 3
var king_hp = 3
var hit_window = false

func _ready() -> void:
	pool.shuffle()
	# usurper_hp = Globals.USURPER_HP
	play_intro()
	begin()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hit_window:
		get_input()
	update_hp()

func get_input():
	if Input.is_action_pressed("rock"):
		choice = 1
		$Usurper/JugadorPiedra.visible = true
		$Usurper/JugadorPapel.visible = false
		$Usurper/JugadorTijera.visible = false
	elif Input.is_action_pressed("paper"):
		choice = 2
		$Usurper/JugadorPiedra.visible = false
		$Usurper/JugadorPapel.visible = true
		$Usurper/JugadorTijera.visible = false
	elif Input.is_action_pressed("siccors"):
		$Usurper/JugadorPiedra.visible = false
		$Usurper/JugadorPapel.visible = false
		$Usurper/JugadorTijera.visible = true
		choice = 3

func next_round():
	round += 1
	if usurper_hp <= 0:
		game_over("Lose")
	elif king_hp <= 0:
		game_over("Win")
	else:
		if round > 0:
			$King/ReyPiedra.visible = false
			$King/ReyPapel.visible = false
			$King/ReyTijera.visible = false
			$Usurper/JugadorPiedra.visible = false
			$Usurper/JugadorPapel.visible = false
			$Usurper/JugadorTijera.visible = false
			$FondoJugada.visible = false
		$KingTimer.start(KING_TIME)

func play_intro():
	pass

func begin():
	round = -1
	$Camera2D/AudioStreamPlayer2D.play()
	$EntrePiedras1/AnimationPlayer.play("new_animation")
	next_round()

func update_hp():
	if king_hp < 3:
		$Camera2D/KingHP/HP3.visible = false
	if king_hp < 2:
		$Camera2D/KingHP/HP2.visible = false
	if king_hp < 1:
		$Camera2D/KingHP/HP1.visible = false
	if usurper_hp < 3:
		$Camera2D/UsurperHP/HP3.visible = false
	if usurper_hp < 2:
		$Camera2D/UsurperHP/HP2.visible = false
	if usurper_hp < 1:
		$Camera2D/UsurperHP/HP1.visible = false

func game_over(condition):
	$Camera2D/AudioStreamPlayer2D.stop()
	$Iconos.visible = false
	if condition == "Lose":
		$Camera2D/GameOver.visible = true
	elif condition == "Win":
		$Camera2D/Win.visible = true

func _on_king_timer_timeout() -> void:
	hit_window = true
	$FondoJugada.visible = true
	if pool[round] == 1:
		$King/ReyPiedra.visible = true
	if pool[round] == 2:
		$King/ReyPapel.visible = true
	if pool[round] == 3:
		$King/ReyTijera.visible = true
	$WindowTimer.start(WINDOW_TIME)

func _on_window_timer_timeout() -> void:
	hit_window = false
	if choice == 0:
		usurper_hp -= 1
	elif choice == 1:
		if pool[round] == 2:
			usurper_hp -= 1
		elif pool[round] == 3:
			king_hp -= 1
	elif choice == 2:
		if pool[round] == 3:
			usurper_hp -= 1
		elif pool[round] == 1:
			king_hp -= 1
	elif choice == 3:
		if pool[round] == 1:
			usurper_hp -= 1
		elif pool[round] == 2:
			king_hp -= 1
	$Timer.start(WINDOW_TIME)

func _on_timer_timeout() -> void:
	next_round()
