extends TextureRect

class_name LifeIndicator

var shouldDisplayHeart = false

var texture_full_heart = preload("res://assets/hud/hud_heartFull.png")
var texture_empty_heart = preload("res://assets/hud/hud_heartEmpty.png")

func _process(delta: float) -> void:
	if shouldDisplayHeart:
		texture = texture_full_heart
	else:
		texture = texture_empty_heart
