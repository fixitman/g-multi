extends Control

@onready var lock_indicator = $lock_indicator
@onready var targets = $targets
@onready var time = $time

func lock(locked: bool):
	lock_indicator.visible = locked
	
func update(seconds: int, targets_left: int ):
	time.text = "Time Remaining: " + String.num_uint64(seconds)
	targets.text = "Targets: " + String.num_uint64(targets_left)
