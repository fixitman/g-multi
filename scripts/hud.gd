extends Control


@onready var lock_indicator: ColorRect = $lock_indicator


func lock(locked: bool):
	lock_indicator.visible = locked
	
	
