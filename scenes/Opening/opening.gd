extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(10)


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/0_MicroGameManager/MicroGameManager.tscn")
