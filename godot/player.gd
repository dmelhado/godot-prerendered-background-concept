extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ROTATION_SPEED = 3.0  # Radians per second

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Tank control input
	var turn_input :=  Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	var move_input := Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")

	# Rotate the character (Y-axis only)
	if turn_input != 0:
		rotation.y += turn_input * ROTATION_SPEED * delta

	# Move forward/backward in the direction the character is facing
	var direction := -transform.basis.z  # Forward direction in Godot is -Z
	direction.y = 0  # Keep it horizontal
	direction = direction.normalized()

	if move_input != 0:
		var move_vec := direction * move_input * SPEED
		velocity.x = move_vec.x
		velocity.z = move_vec.z
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
