extends Node2D

#const MultiplayerManager = preload("res://scripts/multiplayer_manager.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	$%Server.pressed.connect(MultiplayerManager.make_server)
	$%Client.pressed.connect(MultiplayerManager.make_client)
	if DisplayServer.get_name() == "headless":
		MultiplayerManager.make_server()
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
