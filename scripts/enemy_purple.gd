extends Node2D
class_name Enemy 

const SPEED = 15
var direction = 1
@onready var player: CharacterBody2D = $"."
@onready var ray_cast_right: RayCast2D = $CollisionShape2D/RayCast_Right
@onready var ray_cast_left: RayCast2D = $CollisionShape2D/RayCast_Left
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer: Timer = $Timer
var is_dead = false

func _on_timer_timeout():
	get_tree().reload_current_scene()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_tree().reload_current_scene()
	
func _physics_process(_delta: float) -> void:
	global_position = player.global_position
	player.position = global_position + Vector2(0,0)

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body.name == "Player" and is_dead == false:
		get_tree().reload_current_scene()
	print("Killed by Enemy!")
	timer.start()
	
func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.name == "Player" and is_dead == false:
		
		print("Enemy", global_position.y)
		print("Player", str(int(body.global_position.y)))
	
	if int(body.global_position.y + 8) < int(global_position.y) :
		is_dead = true
		
	
