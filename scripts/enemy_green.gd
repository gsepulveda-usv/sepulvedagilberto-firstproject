extends Area2D

var is_dead = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and is_dead == false and body.took_damage == false:
		body.respawn()


func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.name == "Player" and is_dead == false:
		queue_free()
