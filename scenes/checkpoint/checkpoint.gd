class_name CheckPoint
extends Area2D


func _on_body_entered(body):
	if body is Player:
		call_deferred("level_complete")

func level_complete():
	get_parent().set_physics_process(false)
	get_tree().change_scene_to_packed(load("res://scenes/main/main.tscn"))
