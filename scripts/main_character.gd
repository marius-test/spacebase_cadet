extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -850.0

@onready var sprite_2d = $Sprite2D

# get the gravity from the project settings to be synced with RigidBody nodes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var last_direction = 1  # 1 for right, -1 for left

func _physics_process(delta):
	# add gravity if character is not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# reset vertical velocity when on the floor to prevent a constant downward force
		velocity.y = 0

	# handle jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# get the input direction and handle horizontal movement
	var direction = Input.get_axis("left", "right")

	if direction:
		velocity.x = direction * SPEED
		last_direction = direction  # update last direction when moving horizontally
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 2)  # smooth deceleration
		
	# handle animations based on movement state
	if not is_on_floor():
		sprite_2d.animation = "jumping"
	elif direction:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# apply movement and slide
	move_and_slide()

	# flip sprite based on last movement direction
	sprite_2d.flip_h = last_direction < 0
