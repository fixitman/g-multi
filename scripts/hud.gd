extends Control

@onready var lock_indicator = $lock_indicator

func lock(locked: bool):
	lock_indicator.visible = locked
	
	
