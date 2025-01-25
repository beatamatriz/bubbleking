extends Node2D

#siguiente direccion en la que tiene que moverse la botella para aumentar el contador
#false = derecha / true = izquierda
var shake_direction = false
#se utiliza esto para determinar la direccion la primera vez que se mueva la botella
var first_shake = true
var target_pos = 0

var x_offset = 100

var original_position
var previous_position

var original_mouse_position
var previous_mouse_position

func _ready() -> void:
	$background.play()
	
	original_position = global_position
	previous_position = original_position
	
	original_mouse_position = get_global_mouse_position()
	previous_mouse_position = original_mouse_position
	
	init_shake()

func _process(delta: float) -> void:
	shake()
	
	if(global_position.x == (original_position.x + target_pos)):
		invert()
	
func init_shake() -> void:
	target_pos = x_offset
	
func shake() -> void:
	global_position.x = original_position.x + clamp(previous_position.x + get_global_mouse_position().x - previous_mouse_position.x, -x_offset, x_offset)
	previous_position = global_position - original_position
	previous_mouse_position = get_global_mouse_position()
	
func invert() -> void:
	if(shake_direction):
		$shake.play()
	else:
		$shake.play()
	
	target_pos = -target_pos
	shake_direction = !shake_direction
	get_parent().count += 1
