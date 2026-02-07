extends Area2D
class_name Enemy 

const SPEED = 30
var direction = 1
var velocity = Vector2.ZERO
var speed = 300
var health = 5
var is_dead = false
var is_on_floor: bool = false
@onready var ray_cast_right = $CollisionShape2D/RayCast_Right
@onready var ray_cast_left = $CollisionShape2D/RayCast_Left
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	
	position.x += direction * SPEED * delta
	
func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.name == "Player" and is_dead == false:
		body.bounce_after_stomp()
		health -= 1
	print("Enemy hit! Remaining health: ", health)
	if health <= 0:
		$AnimatedSprite2D.play("dead")
	await $AnimatedSprite2D.animation_finished		
	queue_free()
