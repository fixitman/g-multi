extends Node3D

@onready var world_environment = $WorldEnvironment
@onready var hud: Control = $hud
@onready var countdown = $countdown

const BOX = preload("res://scenes/box.tscn")

@export var targets = 20
@export var time_limit_seconds = 60

var targets_remaining = targets
var time_left = time_limit_seconds


# Called when the node enters the scene tree for the first time.
func _ready():	
	for i in range(0,targets):
		var b = BOX.instantiate()
		var x = randi() % 6000 -3000
		var y = randi() % 6000 - 3000
		var z = randi() % 6000 - 3000
		world_environment.add_child(b)
		var v = Vector3(x,y,z)
		b.set_global_position(v) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	hud.update(time_left, targets_remaining)
	pass

func lock(_lock: bool):
	hud.lock(_lock)

func _on_countdown_timeout():
	time_left -= 1
	if time_left <= 0:
		time_left = 0
		countdown.stop()
		
func _on_target_destroyed():
	targets_remaining -= 1
	
