class_name JumpComponent
extends Node

@export var JUMP_VELOCITY: float = -600.0

var can_double_jump: bool = true
var is_jumping: bool = false

func jump(body: CharacterBody2D, delta: float, want_to_jump: bool):
	if want_to_jump and body.is_on_floor():
		body.velocity.y += JUMP_VELOCITY
		can_double_jump = true
		
	is_jumping = body.velocity.y < 0 and not body.is_on_floor()	
