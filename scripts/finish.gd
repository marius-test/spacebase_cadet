extends Area2D

@export var target_level : PackedScene

func _on_body_entered(body):
	# check if the colliding body is the player character
	if body is CharacterBody2D:
		# change the current scene to the target level
		get_tree().change_scene_to_packed(target_level)
