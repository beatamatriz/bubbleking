extends StaticBody2D

var clickable = false
@export var POPPED = false

func begin() -> void:
	if not POPPED:
		if name == "Bea":
			$AnimationPlayer.play("Snore1")
		if name == "Ingrid":
			$AnimationPlayer.play("Snore2")
		if name == "Julia":
			$AnimationPlayer.play("Snore3")

func _process(delta: float) -> void:
	if get_parent().get_parent().active and not POPPED and clickable and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pop()
		
func pop():
	$Pop.play()
	$AnimationPlayer.play("Woke")
	get_parent().get_parent().count += 1
	POPPED = true
	
func _mouse_enter() -> void:
	clickable = true
func _mouse_exit() -> void:
	clickable = false
