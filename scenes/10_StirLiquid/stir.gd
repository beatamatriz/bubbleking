extends Node2D

var center = Vector2(0,0)
var previous_mouse_position = Vector2(0,0)
var mouse_movement = Vector2(0,0)

var count = 0
var current_circle_segment = 0

func _ready() -> void:
	previous_mouse_position = get_global_mouse_position()

func _process(delta: float) -> void:
	mouse_movement = get_global_mouse_position() - previous_mouse_position
	previous_mouse_position = get_global_mouse_position()
	
	#if(mouse_movement.normalized().length() < 0.5):
	#	return
	
	match(current_circle_segment):
		0:
			if(mouse_movement.normalized().x > 0.5 and mouse_movement.normalized().y < 0.3 and mouse_movement.normalized().y > -0.3):
				current_circle_segment += 1
		1:
			if(mouse_movement.normalized().x < 0.5 and mouse_movement.normalized().x > 0 and mouse_movement.normalized().y < -0.5):
				current_circle_segment += 1
		2:
			if(mouse_movement.normalized().x > -0.5 and mouse_movement.normalized().x <  0 and mouse_movement.normalized().y < -0.5):
				current_circle_segment += 1
		3:
			if(mouse_movement.normalized().x < 0.5 and mouse_movement.normalized().y < 0.3 and mouse_movement.normalized().y > -0.3):
				current_circle_segment += 1
		4:
			if(mouse_movement.normalized().x > -0.5 and mouse_movement.normalized().x < 0 and mouse_movement.normalized().y > 0.5):
				current_circle_segment += 1
		5:		
			if(mouse_movement.normalized().x < 0.5 and mouse_movement.normalized().x > 0 and mouse_movement.normalized().y > 0.5):
				complete_circle()
	#print_debug(mouse_movement.normalized())


func complete_circle() -> void:
	current_circle_segment = 0
	get_parent().count += 1
