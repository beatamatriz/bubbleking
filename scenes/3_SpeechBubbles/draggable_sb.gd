extends Node2D

var clickable = false
var dragging = false
var dragging_offset = 0

var original_scale = Vector2(0, 0)
var scale_multiplier = 1.1

var success_offset = 35

var locked = false;

#func _init() -> void:
	#original_scale = $Sprite2D.scale

func _process(delta: float) -> void:
	if(locked):
		return
		
	if (clickable and !dragging and Input.is_action_pressed("click")):
		start_drag()
		
	if dragging:
		$Area.global_position = get_global_mouse_position() + dragging_offset
		if(Input.is_action_just_released("click")):
			drop()
		
func start_drag():
	original_scale = $Area/Sprite.scale
	
	dragging = true;
	dragging_offset = $Area.global_position - get_global_mouse_position()
	$Area/Sprite.scale = original_scale * scale_multiplier
	
func drop():
	dragging = false;
	dragging_offset = 0
	$Area/Sprite.scale = original_scale
	
	#print_debug(($Area.global_position - $Objective.global_position).length())
	if(($Area.global_position - $Objective.global_position).length() < success_offset):
		lock()
	
func lock():
	locked = true
	$Area/Sprite.modulate = "ffffff"
	get_parent().get_parent().get_parent().count += 1
	
func _mouse_enter() -> void:
	if(dragging or locked):
		return
		
	clickable = true
	$Area/Sprite.modulate = "978fff"
	
func _mouse_exit() -> void:
	if(dragging or locked):
		return
		
	clickable = false
	$Area/Sprite.modulate = "ffffff"
