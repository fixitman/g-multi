extends Area3D
const EXPLOSION = preload("res://scenes/explosion.tscn")
@onready var mesh = $mesh
@onready var collision_shape_3d = $CollisionShape3D





func destroy():
	var e = EXPLOSION.instantiate()
	add_sibling(e)
	e.global_position = self.global_position
	mesh.hide()
	collision_shape_3d.disabled = true
	e.explode()
	#await get_tree().create_timer(2)
	queue_free()
	
	
