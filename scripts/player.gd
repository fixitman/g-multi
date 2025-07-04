extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var lerp_speed = 8
@export var direction = Vector2.ZERO

var player_id = 0

func _enter_tree():
	$InputSynchronizer.set_multiplayer_authority(name.to_int())
	

func is_clear(pt: Vector2):
	var probe = get_node("probe")
	probe.set_global_position(pt)
	await get_tree().physics_frame
	if probe.has_overlapping_bodies():
		return false
	else:
		return true
		
func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if multiplayer.is_server():
		direction = $InputSynchronizer.input_direction
	
		if direction:
			velocity = direction * SPEED
		else:
			velocity = lerp(velocity,Vector2.ZERO,lerp_speed * delta)
	
		move_and_slide()
