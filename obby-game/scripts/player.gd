extends Node2D

class_name Player
@onready var bunny: AnimatedSprite2D = $bunny

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var last_direction: String = "down" 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_right"):
		bunny.position.x += 100.0 * delta
		bunny.play("right")
		last_direction = "right"
		
	elif Input.is_action_pressed("ui_left"):
		bunny.position.x -= 100.0 * delta
		bunny.play("left")
		last_direction = "left"
		
	elif Input.is_action_pressed("ui_up"):
		bunny.position.y -= 100.0 * delta
		bunny.play("up")
		last_direction = "up"
		
	elif Input.is_action_pressed("ui_down"):
		bunny.position.y += 100.0 * delta
		bunny.play("down")
		last_direction = "down"
		
	elif last_direction == "up":
		bunny.play("idle_up")
		
	else:
		bunny.play("idle_down")
		
	pass
