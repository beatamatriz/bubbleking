extends CharacterBody2D

const SPEED = 100

func _physics_process(delta):
	if get_parent().active:
		var vec = get_parent().get_global_mouse_position() - global_position # getting the vector from self to the mouse
		velocity = vec*SPEED
		move_and_slide()
