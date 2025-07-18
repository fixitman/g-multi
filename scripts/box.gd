extends Area3D
const EXPLOSION = preload("res://scenes/explosion.tscn")
@onready var mesh = $mesh





func destroy():
	var e = EXPLOSION.instantiate()
	add_sibling(e)
	e.global_position = self.global_position
	mesh.hide()
	e.explode()
	
	
