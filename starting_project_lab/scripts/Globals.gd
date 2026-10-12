extends Node
signal lives_changed

const player_max_lives = 3
var player_current_lives = 3

func lose_life() -> void:
	player_current_lives = max(player_current_lives - 1, 0)
	lives_changed.emit()
