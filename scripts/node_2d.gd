extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var p2 = %body2.get_global_position()
	%body1.get_node("probe").position = p2
	await get_tree().physics_frame
	var x = %body1.get_node("probe").get_overlapping_bodies()
	print(x)
	
