extends CharacterBody3D

const SPEED = 5
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
var rotation_time = 0.5
var rotate = false
@onready var timer = $Timer
@onready var animation_player = $AnimationPlayer


func _process(_delta):
	if Input.is_action_just_pressed("Rotate_cam_L") and rotate == true:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		self.rotate = false
		timer.start()
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees-Vector3(0,90,0), rotation_time)
	elif Input.is_action_just_pressed("Rotate_cam_R") and rotate == true:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		self.rotate = false
		timer.start()
		var tween = create_tween()
		tween.tween_property(self, "rotation_degrees", rotation_degrees+Vector3(0,90,0), rotation_time)
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
	
	#Move the player
	if direction:
		animation_player.play("Walking")
		if self.rotation_degrees.y == 0:
			velocity.x = direction * SPEED
		elif self.rotation_degrees.y == 90 or self.rotation_degrees.y == -270:
			velocity.z = -direction * SPEED
		elif self.rotation_degrees.y == 180 or self.rotation_degrees.y == -180:
			velocity.x = -direction * SPEED
		elif self.rotation_degrees.y == -90 or self.rotation_degrees.y == 270:
			velocity.z = direction * SPEED
	else:
		animation_player.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _on_timer_timeout():
	self.rotate = true
  
func jump_logic(delta):
	if is_on_floor():
		coyote_timer = coyote_max
		is_jumping = false
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = jump_buffer_max
	
	if coyote_timer > 0 and jump_buffer_timer > 0 and not is_jumping:
    animation_player.play("Jumping")
		is_jumping = true
		coyote_timer = 0
		jump_buffer_timer = 0
		
		velocity.y = JUMP_VELOCITY
	
	coyote_timer -= delta
	jump_buffer_timer -= delta