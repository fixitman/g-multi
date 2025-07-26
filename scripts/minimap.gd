extends Node3D

var targets: PackedVector3Array
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	targets.clear()
	for target in get_tree().get_nodes_in_group("targets"):		
		targets.append(player.to_local(target.global_position))
	
	
		
	var image = Image.create(1,500,false,Image.FORMAT_RGBAF)
	image.set_pixel(0,0,Color((float(targets.size())),0,0))
	for i in range(targets.size()):
		image.set_pixel(0,i+1,Color(targets[i].x,targets[i].y,targets[i].z))
		
		
		
	var tex = ImageTexture.create_from_image(image)
	
	$CanvasLayer/TextureRect.material.set_shader_parameter("target_data",tex)
	
	
	
