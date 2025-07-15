extends CharacterBody3D


const SPEED = 100          



func _physics_process(delta):
	
	global_position += -transform.basis.z * SPEED * delta

	
