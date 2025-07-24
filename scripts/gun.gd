extends Node3D
const BULLET = preload("res://scenes/bullet.tscn")

@onready var gun_mount = $Gun_Mount
@onready var gun_mount_2 = $Gun_Mount2
@onready var shoot_cast = $shoot_cast
@onready var firing_timeout = $firing_timeout
@onready var ship = get_parent()
@onready var hud = $HUD
@onready var lock_indicator = $HUD/lock_indicator

@export var fire_rate = 8.0
@export var gun_damage = 40
@export var bullet_range = 5000

var firing = false
var mount_points: Array 

# Called when the node enters the scene tree for the first time.
func _ready():
	mount_points.push_front(gun_mount)
	mount_points.push_front(gun_mount_2)
	$firing_timeout.wait_time = 1 / fire_rate


func _process(delta):
	lock(shoot_cast.is_colliding())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("shoot_gun") and not firing:
		$firing_timeout.wait_time = 1 / fire_rate
		firing = true
		$firing_timeout.start()
		shoot()

func shoot():
	#show the bullets (visual only)
	for mount_pt in mount_points:
		var bullet = BULLET.instantiate()
		ship.add_sibling(bullet)
		bullet.global_position = mount_pt.global_position 
		bullet.global_rotation = self.global_rotation
	#	
	if shoot_cast.is_colliding():
		await get_tree().create_timer(.15).timeout
		for target in shoot_cast.collision_result:
			if target.collider.has_method("hit"):
				target.collider.hit(gun_damage,global_position)
			else:
				target.collider.queue_free()
		
func _on_firing_timeout_timeout():
	firing = false
	
func lock(locked: bool):
	lock_indicator.visible = locked
