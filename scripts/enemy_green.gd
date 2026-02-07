extends Area2D

const SPEED = 40
var direction = 1
var velocity = Vector2.ZERO
var speed = 300
var is_dead = false
var is_on_floor: bool = false
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

@export var move_dir : Vector2

var start_pos : Vector2
var target_pos : Vector2

func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir

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
		$AnimatedSprite2D.play("dead")
		await $AnimatedSprite2D.animation_finished
		queue_free()

func _on_kill_box_body_entered(body: Node2D) -> void:
	if body is TileMapLayer or body is AnimatedSprite2D or body is CollisionShape2D:
		body.is_on_floor = true
		body.is_dead = true
