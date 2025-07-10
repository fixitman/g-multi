extends CharacterBody3D
@onready var camera = %Camera3D
@onready var ship = %ship

@export var yaw_rate = -25
@export var pitch_rate = 50
@export var roll_rate = -50
@export var SPEED = 10
@export var roll_return = 5.0
@onready var model = $model

@export var turn_speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#func _physics_process(delta):
	#var yaw = Input.get_axis("left","right")
	#var pitch = Input.get_axis("up","down")
	#var roll_only = Input.is_action_pressed("roll_only")
	#
	##transform.basis = Basis()
	#if not roll_only:
		#rotate_object_local(Vector3(0,1,0),deg_to_rad(yaw) * yaw_rate * delta)
	#
	#rotate_object_local(Vector3(0,0,1),deg_to_rad(yaw) * roll_rate * delta)
	#rotate_object_local(Vector3(1,0,0),deg_to_rad(pitch) * pitch_rate * delta)
	#
	#
#
	#velocity = transform.basis.z * -SPEED 
	#
	#move_and_slide()
func _physics_process(delta):
	if Input.is_action_pressed("up"):
		global_rotate(transform.basis.x, turn_speed * delta)
	if Input.is_action_pressed("down"):
		global_rotate(transform.basis.x, -turn_speed * delta)
	if Input.is_action_pressed("right"):
		global_rotate(transform.basis.y, -turn_speed * delta)
	if Input.is_action_pressed("left"):
		global_rotate(transform.basis.y, turn_speed * delta)
	if Input.is_action_pressed("left"):
		global_rotate(transform.basis.z, turn_speed * delta)
	if Input.is_action_pressed("right"):
		global_rotate(transform.basis.z, -turn_speed * delta)
		transform.basis
	
	move_and_collide(-global_transform.basis.z * SPEED * delta)
	
		
	
	
	pass
