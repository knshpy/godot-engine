extends Button


func _on_pressed() -> void:
	get_tree().paused = false
	Globals.player_current_lives = Globals.player_max_lives
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

	
	
