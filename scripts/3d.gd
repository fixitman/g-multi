extends Node3D
@onready var world_environment = $WorldEnvironment

const BOX = preload("res://scenes/box.tscn")
@export var boxcount = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1,20):
		var b = BOX.instantiate()
		var x = randi() % 6000 -3000
		var y = randi() % 6000 - 3000
		var z = randi() % 6000 - 3000
		world_environment.add_child(b)
		var v = Vector3(x,y,z)
		b.set_global_position(v) 
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
