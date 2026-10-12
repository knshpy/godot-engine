extends Control
 

func _on_play_button_pressed() -> void:
	Globals.player_current_lives = Globals.player_max_lives
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
