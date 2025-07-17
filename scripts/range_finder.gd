extends Node3D

var mouse_pos = Vector2()
const DISTANCE = 1000000

func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position
	if event is InputEventMouseButton:
		if not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			get_mouse_world_pos(mouse_pos)
			
			
func get_mouse_world_pos(mouse: Vector2):
	var space = get_world_3d().direct_space_state
	var start = get_viewport().get_camera_3d().project_ray_origin(mouse)
	var end = start + get_viewport().get_camera_3d().project_ray_normal(mouse) * DISTANCE
	var params = PhysicsRayQueryParameters3D.new()
	params.from = start
	params.to = end
	params.collide_with_areas = true
	params.collide_with_bodies = true
	var result = space.intersect_ray(params)
	if result:
		print(result)
		var point: Vector3 = result.position
		var mypos = global_position
		var distance = mypos.distance_to(point)
		print("distance: ", distance)
		result.collider.queue_free()
			
