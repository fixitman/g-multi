extends CharacterBody3D
const BULLET = preload("res://scenes/bullet.tscn")
const EXPLOSION = preload("res://scenes/explosion.tscn")

@onready var camera = %Camera3D
@onready var flame_material = $visual/flame_port.material_override
@onready var flame_starboard = $visual/flame_starboard
@onready var visual = $visual
@onready var gun = $Gun

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


var firing = false
var micro_multiplier = 1
var turbo_multiplier = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass
	


func _physics_process(delta):
	var yaw = Input.get_axis("left","right")
	var pitch = Input.get_axis("up","down")
	
	if Input.is_action_pressed("micro"):
		micro_multiplier = .2
	else:
		micro_multiplier = 1
		
	#ship rotation
	rotate_object_local(Vector3(0,1,0),deg_to_rad(yaw) * yaw_rate * micro_multiplier * delta)	
	rotate_object_local(Vector3(1,0,0),deg_to_rad(pitch) * pitch_rate * micro_multiplier * delta)
	
	#visual effect only
	if Input.is_action_pressed("left"):
		visual.rotation_degrees.z = lerp(visual.rotation_degrees.z, max_roll_deg, bank_rate * delta )
	elif Input.is_action_pressed("right"):
		visual.rotation_degrees.z = lerp(visual.rotation_degrees.z, -max_roll_deg, bank_rate * delta )
	else:
		visual.rotation_degrees.z = lerp(visual.rotation_degrees.z, 0.0, bank_rate * delta )
	
	if Input.is_action_pressed("down"):
		visual.rotation_degrees.x = lerp(visual.rotation_degrees.x, max_vroll_deg, vroll_rate * delta )
	elif Input.is_action_pressed("up"):
		visual.rotation_degrees.x = lerp(visual.rotation_degrees.x, -max_vroll_deg, vroll_rate * delta )
	else:
		visual.rotation_degrees.x = lerp(visual.rotation_degrees.x, 0.0, vroll_rate * delta )
	
	if Input.is_action_pressed("turbo"):
		turbo_on()		
	else:
		turbo_off()
	
	
	
	
	#always moving wherever the ship is pointing
	velocity = transform.basis.z * -SPEED * turbo_multiplier	
	move_and_slide()
#


		
func turbo_on():
	turbo_multiplier = 5
	flame_material.emission_energy_multiplier = 2.5

func turbo_off():
	turbo_multiplier = 1
	flame_material.emission_energy_multiplier = .5
	
		
	
