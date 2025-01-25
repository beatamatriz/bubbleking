extends StaticBody2D

var clickable = false
var popped = false

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not popped and clickable and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pop()
		
func pop():
	$Sprite2D.visible = false  # POP!!!
	get_parent().get_parent().count += 1
	popped = true
	
func _mouse_enter() -> void:
	clickable = true
	$Sprite2D.modulate = "978fff"
func _mouse_exit() -> void:
	clickable = false
	$Sprite2D.modulate = "ffffff"
