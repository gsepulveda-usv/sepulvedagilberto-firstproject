extends Node2D

@onready var timer: Timer = $Timer
var took_damage = false
var can_move = true

func respawn():
	took_damage = true
	self.visible = false
	can_move = false
	await get_tree().create_timer(0.5).timeout

func _on_area_2d_body_entered(body):
	print("Oh no! You died!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
