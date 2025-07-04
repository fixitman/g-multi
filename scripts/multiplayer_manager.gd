extends Node

const SERVER_IP = "localhost"
const PORT = 8910

var player_scene = preload("res://scenes/player.tscn")
var players
var hud


func _ready():
	players = get_tree().get_current_scene().get_node("Players")
	hud = get_tree().get_current_scene().get_node("HUD")

func make_server() :
	print("making server")
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(PORT)
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(add_player)	
	multiplayer.peer_disconnected.connect(del_player)
	
	hud.visible = false
	


func make_client():
	print("making client")
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP,PORT)
	multiplayer.multiplayer_peer = client_peer
	hud.visible = false
	
	

func add_player(id: int):
	if multiplayer.is_server():
		print("adding player %s" % id)
		var player2 = player_scene.instantiate()
		
		player2.player_id = id
		player2.name = str(id)
		players.add_child(player2, true)
		await get_tree().physics_frame #not sure why this is necessary
		for pt in get_tree().get_nodes_in_group("spawn_points"):			
			if await player2.is_clear(pt.get_global_position()):
				player2.set_global_position(pt.get_global_position())
				#break
	else:
		print("non-server call")
	
	

func del_player(id: int):
	if multiplayer.is_server():
		print("deleting player %s" % id)
		if players.has_node(str(id)):
			players.get_node(str(id)).queue_free()
	pass





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
