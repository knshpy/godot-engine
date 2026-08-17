extends CharacterBody2D

class_name Player

@onready var bunny: AnimatedSprite2D = $bunny
@onready var exp_label: Label = $exp_label


var start_position = Vector2(85,50)
var exp_amount: int = 0

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
		bunny.flip_h = false
	elif direction == -1:
		bunny.flip_h = true
		
	if direction:
		bunny.play("walking")
	else:
		bunny.play("idle")
		
	if not is_on_floor():
		bunny.play("jumping")

	move_and_slide()
	
func respawn() -> void:
	position = start_position
	
func _ready() -> void:
	update_exp_label()
	
func add_exp(amount: int) -> void:
	exp_amount += amount 
	update_exp_label()
	
func update_exp_label() -> void:
	exp_label.text = "exp: " + str(exp_amount) 
