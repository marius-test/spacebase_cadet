extends Area2D

@onready var game_manager = %GameManager

func _on_body_entered(body):
	# check if the colliding body is the player character
	if body is CharacterBody2D:
		# add a point in the game manager
		game_manager.add_point()
		
		# remove the collectable from the scene
		queue_free()
