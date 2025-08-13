extends Control

func _on_resume_pressed():
	# unpause the game and hide pause menu
	get_tree().paused = false
	hide()

func _on_main_menu_pressed():
	# go back to main menu scene
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
