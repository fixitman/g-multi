extends Node3D

@export var SPEED = 5000



func _physics_process(delta):
	global_position += -transform.basis.z * SPEED * delta
	


func _on_die_timer_timeout():
	queue_free()
	pass
