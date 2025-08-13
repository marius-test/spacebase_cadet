extends Control

# change scene to level 1 when level 1 button is pressed
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

# change scene to level 2 when level 2 button is pressed
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
