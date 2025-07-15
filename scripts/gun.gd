extends Node3D
const BULLET = preload("res://scenes/bullet.tscn")
@onready var barrel = $Barrel



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		var bullet = BULLET.instantiate()
		add_sibling(bullet)
		bullet.global_position = barrel.global_position
		bullet.global_rotation = self.global_rotation
		
		
		
		
