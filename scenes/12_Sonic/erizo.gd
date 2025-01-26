extends CharacterBody2D


const SPEED = 999.0


func _physics_process(delta: float) -> void:
	if get_parent().active:
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = max(0, direction * SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
