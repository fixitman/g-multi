extends Node3D

var targets: PackedVector3Array
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	targets.clear()
	for target in get_tree().get_nodes_in_group("targets"):
		
		targets.append(player.to_local(target.global_position))
		
		
	for i in range(0,20 - targets.size()-1):
		targets[i] = Vector3.ZERO
	
	$CanvasLayer/TextureRect.material.set_shader_parameter("target_data",targets)
	
	
	
