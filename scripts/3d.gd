extends Node3D

const BOX = preload("res://scenes/box.tscn")
@export var boxcount = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1,20):
		var b = BOX.instantiate()
		var x = randi() % 10000 -5000
		var y = randi() % 10000 - 5000
		var z = randi() % 10000 - 5000
		add_child(b)
		var v = Vector3(x,y,z)
		print(v)
		b.set_global_position(v)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
