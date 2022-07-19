extends Node

var username = ""

var connection_map = "res://Network/Connection_map.tscn"
var map = "res://MainScene.tscn"
var chat = load("res://Network/chat/Chat.tscn").instance()
var player = "res://Network/player/Player.tscn"
var spawn = null

func _ready():
	get_tree().connect("network_peer_connected", self, "_on_network_peer_connected")
	get_tree().connect("network_peer_disconnected", self, "_on_network_peer_disconnected")
	get_tree().connect("connected_to_server", self, "_on_connected_to_server")
	get_tree().connect("server_disconnected", self, "_on_server_disconnected")

func create_server(username_chosen):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(4242, 32)
	get_tree().set_network_peer(peer)
	
	AudioServer.set_bus_mute(0, true) # The server mutes the game
	username = username_chosen + " (host)"
	
	load_game()

func join_server(to_ip, username_chosen):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(to_ip, 4242)
	get_tree().set_network_peer(peer)
	
	username = username_chosen
	
	# If a server is detected calls _on_connected_to_server() to load the game

func load_game():
	get_tree().change_scene(map)
	
	yield(get_tree().create_timer(0.01), "timeout")
	
	get_tree().get_root().add_child(chat)

func spawn_player(id):
	var player_instance = load(player).instance()
	player_instance.name = str(id)	
	# Only the client that own the player can control it
	player_instance.set_network_master(id)

func get_IP():
	for ip in IP.get_local_addresses():
		if ip.begins_with("192.168."):
			return ip

# Spawn the other players that connected exepted from the server:
func _on_network_peer_connected(id):
	if id != 1: # If this is not the server spawn the player
		spawn_player(id)

func _on_network_peer_disconnected(id):
	if id != 1:
		get_tree().get_root().find_node(str(id), true, false).queue_free()

func _on_connected_to_server():
	load_game()

func _on_server_disconnected():
	get_tree().change_scene(connection_map)
	get_node("/root/Chat").queue_free()
	get_tree().set_network_peer(null)
