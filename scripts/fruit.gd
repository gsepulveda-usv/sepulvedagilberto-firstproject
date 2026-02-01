extends Node2D

var picked_up = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if picked_up == false:
		picked_up = true
		print("Health +1")
		$AnimatedSprite2D.visible = false
		await get_tree().create_timer(0.5).timeout
		queue_free()
	
	if body.name == "player":
		body.score += 1
		self.queue_free()
		print(body.score)
