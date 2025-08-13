extends Node

# reference to the points label node
@onready var points_label = get_node("../UI/Panel/PointsLabel")

# variable to store the player's score
var points = 0

# variable to store the pause menu instance
var pause_menu

func _ready():
	# preload the pause menu scene
	var pause_menu_scene = preload("res://scenes/pause_menu.tscn")
	
	# instantiate the pause menu
	pause_menu = pause_menu_scene.instantiate()
	
	# add the pause menu as a child of the current scene
	add_child(pause_menu)
	
	# hide the pause menu initially
	pause_menu.hide()

func add_point():
	# increment the score when a collectable is grabbed
	points += 1
	print(points)
	points_label.text = "Score: " + str(points)

func toggle_pause():
	# flip the paused state of the game
	get_tree().paused = not get_tree().paused
	
	# show the pause menu if the game is paused, hide if unpaused
	pause_menu.visible = get_tree().paused
