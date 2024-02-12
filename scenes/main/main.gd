extends Node

var level: PackedScene = preload("res://scenes/level/level.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(level)

func _on_quit_button_pressed():
	get_tree().quit()
