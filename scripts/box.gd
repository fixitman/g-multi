extends Area3D
const EXPLOSION = preload("res://scenes/explosion.tscn")
@onready var mesh = $mesh
@onready var collision_shape_3d = $CollisionShape3D
@onready var shield = $shield


const MAX_HEALTH = 100
var health = MAX_HEALTH

signal _target_destroyed

func _enter_tree():
	var game = get_node("../..")
	_target_destroyed.connect(Callable(game, "_on_target_destroyed"))

func hit(damage:int, from: Vector3)-> void:
	health -= damage
	if health <= 0:
		destroy()
	else:
		shield.look_at(from)
		shield.visible = true
		await get_tree().create_timer(.2).timeout
		shield.visible = false

func destroy():
	var e = EXPLOSION.instantiate()
	add_sibling(e)
	e.global_position = self.global_position
	mesh.hide()
	collision_shape_3d.disabled = true
	e.explode()
	_target_destroyed.emit()
	queue_free()
	
	
	
