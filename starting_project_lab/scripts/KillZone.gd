extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Globals.lose_life()
		body.fell_off()
		
		
	if Globals.player_current_lives == 0:
		trigger_game_over()
	
func trigger_game_over() -> void:
	var game_over_screen = get_node("../CanvasLayer/GameOver")
	if game_over_screen:
		game_over_screen.visible = true
		get_tree().paused = true
