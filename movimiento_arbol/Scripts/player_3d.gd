extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var coyote_max = 0.12
@export var jump_buffer_max = 0.2

var coyote_timer = 0.0
var jump_buffer_timer = 0.0
var is_jumping = false
var inventory = ""
var interacting = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var rotate = false
@onready var sprite_3d = $Sprite3D

func _process(delta):
	if Input.is_action_just_pressed("Rotate_cam_L") and rotate == true:
		self.rotation_degrees.y -= 90
	elif Input.is_action_just_pressed("Rotate_cam_R") and rotate == true:
		self.rotation_degrees.y += 90
	if Input.is_action_pressed("interact"): 
		interacting = true
	else: 
		interacting = false
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += -gravity * delta

	# Handle jump.
	jump_logic(delta)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	#Flip the sprite and hitboxes
	if direction > 0:
		sprite_3d.flip_h = false
	elif direction < 0:
		sprite_3d.flip_h = true
	
	#Move the player
	if direction:
		if self.rotation_degrees.y == 0:
			velocity.x = direction * SPEED
		elif self.rotation_degrees.y == 90 or self.rotation_degrees.y == -270:
			velocity.z = -direction * SPEED
		elif self.rotation_degrees.y == 180 or self.rotation_degrees.y == -180:
			velocity.x = -direction * SPEED
		elif self.rotation_degrees.y == -90 or self.rotation_degrees.y == 270:
			velocity.z = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func jump_logic(delta):
	if is_on_floor():
		coyote_timer = coyote_max
		is_jumping = false
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = jump_buffer_max
	
	if coyote_timer > 0 and jump_buffer_timer > 0 and not is_jumping:
		is_jumping = true
		coyote_timer = 0
		jump_buffer_timer = 0
		
		velocity.y = JUMP_VELOCITY
	
	coyote_timer -= delta
	jump_buffer_timer -= delta
