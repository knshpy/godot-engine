extends Node2D

@onready var game_hud: Control = $CanvasLayer/GameHUD

var total_score = 0


func _on_coin_on_item_collected(points: int) -> void:
	total_score += points
	game_hud.totalScore = total_score
	print(total_score)
	
func _ready():
	Globals.player_current_lives = Globals.player_max_lives
