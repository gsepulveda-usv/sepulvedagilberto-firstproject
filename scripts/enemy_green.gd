extends Area2D

const SPEED = 40
var direction = 1
var velocity = Vector2.ZERO
var speed = 300
var health = 1
var is_dead = false
var is_on_floor: bool = false
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
	
func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.name == "Player" and is_dead == false:
		body.bounce_after_stomp()
		$AnimatedSprite2D.play("dead")
		await $AnimatedSprite2D.animation_finished
		queue_free()
