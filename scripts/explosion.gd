extends Node3D



# Called when the node enters the scene tree for the first time.
func explode():
	$particles.emitting = true
	await get_tree().create_timer(1).timeout
	queue_free()
