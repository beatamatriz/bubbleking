extends StaticBody2D

var clickable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clickable and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$Sprite2D.visible = false
		

func _mouse_enter() -> void:
	clickable = true
	$Sprite2D.modulate = "978fff"
func _mouse_exit() -> void:
	clickable = false
	$Sprite2D.modulate = "ffffff"
