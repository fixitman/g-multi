extends Node3D

const rotation_speed = 45 #degrees/sec
@onready var sandbox = $"."
@onready var gun = $Gun


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	gun.rotate_y(deg_to_rad(rotation_speed) * delta)
