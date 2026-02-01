extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
var score = 0
var dead = false
var can_move = true
var took_damage = false
var stomp_impulse := 300

var is_dead : bool = false:
	set(value): 
		if value:
			animated_sprite.play("dead")
			await animated_sprite.animation_finished
			get_tree().reload_current_scene()

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func respawn():
	took_damage = true
	self.visible = false
	can_move = false
	await get_tree().create_timer(0.5).timeout
	
	self.global_position = Vector2(0,1)
	self.visible = true
	can_move = true
	
	await get_tree().create_timer(0.5).timeout
	
	took_damage = false
	
	await get_tree().create_timer(0.5).timeout
	
	took_damage = false

func is_stomping():
	velocity.y = -stomp_impulse

func death():
	animated_sprite.play("dead")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if can_move == false:
		return 
		
	move_and_slide()
	
