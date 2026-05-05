extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	add_to_group("player")
	GameManager.spawn_position = position  # saves where player starts

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("move_left", "move_right")
	
	# play the animations
	if is_on_floor():
		if direction == 0 :
			animated_sprite.play("default")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		  
	if direction > 0 :
		animated_sprite.flip_h = false
		
	if direction < 0 :
		animated_sprite.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
