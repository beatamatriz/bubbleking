extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if get_parent().get_parent().active:
		get_parent().get_parent().suck()
		$Sprite.visible = false
