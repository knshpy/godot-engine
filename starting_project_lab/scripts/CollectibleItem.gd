extends Area2D

class_name CollectibleItem

@export var points: int = 0

signal on_item_collected(points: int)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		emit_signal("on_item_collected", points)
		queue_free()
