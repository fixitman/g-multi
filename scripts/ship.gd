extends CharacterBody3D
@onready var camera = %Camera3D
@onready var ship = %ship
@onready var visual = $visual


@export var yaw_rate = -25
@export var pitch_rate = 50
@export var roll_rate = -50
@export var bank_rate = 5
@export var vroll_rate = 5
@export var max_roll_deg = 20.0
@export var max_vroll_deg = 20.0
@export var SPEED = 100
@export var roll_return = 5.0

@export var turn_speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	


func _physics_process(delta):
	var yaw = Input.get_axis("left","right")
	var pitch = Input.get_axis("up","down")
	var roll_only = Input.is_action_pressed("roll_only")
	
	#change actual heading
	rotate_object_local(Vector3(0,0,1),deg_to_rad(yaw) * roll_rate * delta)
	rotate_object_local(Vector3(1,0,0),deg_to_rad(pitch) * pitch_rate * delta)
	if not roll_only:
		rotate_object_local(Vector3(0,1,0),deg_to_rad(yaw) * yaw_rate * delta)
		
	#visual effect only
	if Input.is_action_pressed("left"):
		visual.rotation_degrees.z = lerp(visual.rotation_degrees.z, max_roll_deg, bank_rate * delta )
	elif Input.is_action_pressed("right"):
		visual.rotation_degrees.z = lerp(visual.rotation_degrees.z, -max_roll_deg, bank_rate * delta )
	else:
		visual.rotation_degrees.z = lerp(visual.rotation_degrees.z, 0.0, bank_rate * delta )
	clamp(visual.rotation_degrees.z,-max_roll_deg, max_roll_deg)	
	
	if Input.is_action_pressed("down"):
		visual.rotation_degrees.x = lerp(visual.rotation_degrees.x, max_vroll_deg, vroll_rate * delta )
	elif Input.is_action_pressed("up"):
		visual.rotation_degrees.x = lerp(visual.rotation_degrees.x, -max_vroll_deg, vroll_rate * delta )
	else:
		visual.rotation_degrees.x = lerp(visual.rotation_degrees.x, 0.0, vroll_rate * delta )
	clamp(visual.rotation_degrees.x,-max_roll_deg, max_roll_deg)	
	
	
	
	
	
		
	
	

	velocity = transform.basis.z * -SPEED 
	
	move_and_slide()
#func _physics_process(delta):
	#if Input.is_action_pressed("up"):
		#global_rotate(transform.basis.x, turn_speed * delta)
	#if Input.is_action_pressed("down"):
		#global_rotate(transform.basis.x, -turn_speed * delta)
	#if Input.is_action_pressed("right"):
		#global_rotate(transform.basis.y, -turn_speed * delta)
	#if Input.is_action_pressed("left"):
		#global_rotate(transform.basis.y, turn_speed * delta)
	#if Input.is_action_pressed("left"):
		#global_rotate(transform.basis.z, turn_speed * delta)
	#if Input.is_action_pressed("right"):
		#global_rotate(transform.basis.z, -turn_speed * delta)
		#transform.basis
	#
	#move_and_collide(-global_transform.basis.z * SPEED * delta)
	#
		
	
	
	pass
