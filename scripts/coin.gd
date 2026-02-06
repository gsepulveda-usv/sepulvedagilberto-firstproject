extends Node2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager = %GameManager

var picked_up = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if picked_up == false:
		picked_up = true
		print("+1 coin!")
		game_manager.add_point()
		animated_sprite_2d.visible = false
		audio_stream_player_2d.play()
		await get_tree().create_timer(0.5).timeout
		queue_free()
	if body.name == "player":
		body.score += 1
		self.queue_free()
		print(body.score)
		
