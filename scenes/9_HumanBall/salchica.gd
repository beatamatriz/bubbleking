extends CharacterBody2D

@export var SPEED = 900.0

func _physics_process(delta: float) -> void:
	if get_parent().active:
		get_input()
		move_and_slide()
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED
