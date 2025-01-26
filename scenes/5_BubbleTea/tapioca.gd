extends Area2D

var sucked = false

func _on_body_entered(body: Node2D) -> void:
	if sucked:
			return
			
	if get_parent().get_parent().active:
		get_parent().get_parent().suck()
		sucked = true
		$Sprite.visible = false
