extends CharacterBody2D

@export var SPEED = 900.0

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction == Vector2(0, 0):
		$AnimationPlayer.play("Idle")
	else:
		$AnimationPlayer.play("Moving")
	velocity = input_direction * SPEED
	
func die():
	SPEED = 0
