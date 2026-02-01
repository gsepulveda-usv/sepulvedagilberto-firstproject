extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer or body is AnimatedSprite2D or body is CollisionShape2D:
		owner.is_dead = true
