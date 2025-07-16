extends CharacterBody3D


@export var SPEED = 1000         
@onready var mesh = $mesh



func _physics_process(delta):
	
	global_position += -transform.basis.z * SPEED * delta

func set_color(c:Color):
	var m: StandardMaterial3D = $mesh.get_active_material(0)
	m.albedo_color = c
	


func _on_die_timer_timeout():
	#queue_free()
	pass
