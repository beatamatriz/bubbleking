extends StaticBody2D

var clickable = false
@export var POPPED = false

func _ready() -> void:
	if not POPPED:
		$AnimationPlayer.play("Snore")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not POPPED and clickable and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pop()
		
func pop():
	$AnimationPlayer.play("Woke")
	get_parent().get_parent().count += 1
	POPPED = true
	
func _mouse_enter() -> void:
	clickable = true
func _mouse_exit() -> void:
	clickable = false
