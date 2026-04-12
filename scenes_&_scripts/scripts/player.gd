extends CharacterBody3D

# === CONFIG ===
var speed = 5.0
var mouse_sensitivity = 0.002
var gravity = 9.8
var jump_velocity = 4.5
var can_move = true
var interact_cooldown = 0.0

func disable_movement():
	can_move = false

func enable_movement():
	can_move = true
	
func set_interact_cooldown(time):
	interact_cooldown = time

# Called when the scene starts
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	add_to_group("player")

# Handle mouse movement
func _input(event):
	if event is InputEventMouseMotion:
		# Rotate player around Y axis
		rotate_y(-event.relative.x * mouse_sensitivity)
		# Rotate camera around X axis
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		# Clamp vertical look
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func interact():
	var ray = $Camera3D/InteractRay
	if ray.is_colliding():
		var obj = ray.get_collider()

		if obj.has_method("interact"):
			obj.interact()
		elif obj.get_parent() and obj.get_parent().has_method("interact"):
			obj.get_parent().interact()

func _physics_process(delta):
	if interact_cooldown > 0.0:
		interact_cooldown -= delta
	
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0

	# Stop player logic during dialogue
	if not can_move:
		move_and_slide()
		return

	# Get input
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# Interaction
	if Input.is_action_just_pressed("interact") and interact_cooldown <= 0.0:
		interact()

	# Move player
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = 0
		velocity.z = 0

	move_and_slide()
