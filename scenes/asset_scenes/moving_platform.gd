class_name MovingPlatform
extends CharacterBody2D

@export var startpoint: Marker2D
@export var endpoint: Marker2D

var speed: float = 8.0
var _tween: Tween
	
func _exit_tree():
	_tween.kill()
	
func set_moving() -> void:
	_tween = get_tree().create_tween()
	_tween.set_loops(0)
	_tween.tween_property(self, "global_position", endpoint.global_position, speed)
	_tween.tween_property(self, "global_position", startpoint.global_position, speed)
