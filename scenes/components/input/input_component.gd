class_name InputComponent
extends Node

var input_horizontal: float = 0.0
var input_vertical: float = 0.0

func _process(delta):
	input_horizontal = Input.get_axis("move_left","move_right")
	input_vertical = Input.get_axis("climb_up", "climb_down")
	
func is_climbing():
	return Input.is_action_pressed("climb_up") or Input.is_action_pressed("climb_down")
	
func get_jump_input() -> bool:
	return Input.is_action_just_pressed("jump")
	
func get_attack_input() -> bool:
	return Input.is_action_just_pressed("attack")

func released_jump() -> bool:
	return Input.is_action_just_released("jump")
