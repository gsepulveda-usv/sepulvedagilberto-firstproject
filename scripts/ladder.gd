extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		body.is.on_ladder = true
		
func _on_body_exited(body: Node2D) -> void:
	if "player" in body.name:
		body.is.on_ladder = false
