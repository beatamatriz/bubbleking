extends StaticBody2D

var clickable = false
@export var POPPED = false

func _ready() -> void:
	if POPPED:
		$Shadow.visible = true
	else:
		$Shadow.visible = false

func _process(delta: float) -> void:
	if get_parent().get_parent().active and not POPPED and clickable and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pop()
		get_parent().get_parent().popSound()
		
func pop():
	$Shadow.visible = false
	$Shadow.visible = true
	get_parent().get_parent().count += 1
	POPPED = true
	
func _mouse_enter() -> void:
	clickable = true
func _mouse_exit() -> void:
	clickable = false
