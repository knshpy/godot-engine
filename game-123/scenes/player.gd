extends CharacterBody2D

class_name Player

@onready var player: AnimatedSprite2D = $player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction == 1:
		player.flip_h = false
	elif direction == -1:
		player.flip_h = true
		
	if direction:
		player.play("walking")
	else:
		player.play("idle")
		
	if not is_on_floor():
		player.play("jumping")

	move_and_slide()
