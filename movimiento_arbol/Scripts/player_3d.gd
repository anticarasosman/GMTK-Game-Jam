extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var rotation_time = 0.5
var rotate = false
@onready var sprite_3d = $Sprite3D
@onready var timer = $Timer


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
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += -gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

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

func _on_timer_timeout():
	self.rotate = true
