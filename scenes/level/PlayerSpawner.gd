class_name PlayerSpawner
extends Marker2D

var player: PackedScene = preload("res://scenes/player/player.tscn")

func _ready():
	pass
	
func create_player():
	var new_player = player.instantiate()
	new_player.global_position = position
	new_player.scale = Vector2(2.0, 2.0)
	new_player.add_to_group("Player", true)
	get_parent().add_child(new_player)
