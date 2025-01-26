extends Node2D

@export var GAME_TIMER = 5
@export var CHEW_TIMER = 0.8
@export var MASH_HP = 18

var active = false
var count = 0
var success = false

func _process(delta: float) -> void:
	if active:
		if Input.is_action_just_pressed("ui_accept"):
			count += 1
		if count >= MASH_HP:
			active = false
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle9.visible = true
			success = true
		elif count > 8 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle8.visible = true
		elif count > 7 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle7.visible = true
		elif count > 6 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle6.visible = true
		elif count > 5 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle5.visible = true
		elif count > 4 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle4.visible = true
		elif count > 3 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle3.visible = true
		elif count > 2 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle2.visible = true
		elif count >= 1 * MASH_HP/9:
			for sprite in $SpritesChicle.get_children():
				sprite.visible = false
			$SpritesChicle/Chicle1.visible = true

func begin():
	$Timer.start(GAME_TIMER)
	$ChewTimer.start(CHEW_TIMER)
	$Demonia/AnimationPlayer.play("Chew")
	for sprite in $SpritesChicle.get_children():
		sprite.visible = false

func _on_timer_timeout() -> void:
	if active:
		active = false
		if success:
			get_parent().next("Success")
		else:
			get_parent().next("Failure")

func _on_chew_timer_timeout() -> void:
	active = true
