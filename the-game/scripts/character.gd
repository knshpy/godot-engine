extends CharacterBody2D

class_name player

@onready var player1: AnimatedSprite2D = $player1

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var start_position = Vector2(0, 0)


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
		player1.flip_h = false
	elif direction == -1:
		player1.flip_h = true
	
	#Animation
	if direction:
		player1.play("walking")
	else:
		player1.play("idle")
		
	if not is_on_floor():
		player1.play("jumping")
	
		
	move_and_slide()
	
func respawn() -> void:
	position = start_position
