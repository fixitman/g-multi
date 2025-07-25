extends Camera3D
@export  var ship: NodePath

func _ready():
	pass

func _process(_delta: float) -> void:
	var s: Node3D = get_node(ship)
	var ship_pos = s.global_position
	var ship_rot = s.global_rotation
	
	self.global_position = s.global_position
	self.global_rotation = s.global_rotation
	self.translate_object_local(Vector3(0.0,1000.0,0.0))
	self.rotate_object_local(Vector3(1,0,0),deg_to_rad(-90))
	
	pass
