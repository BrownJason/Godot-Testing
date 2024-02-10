class_name JumpComponent
extends Node

@export var JUMP_VELOCITY: int = -600
@export var gravity = 1200

var can_double_jump: bool = true

func player_jump(body: CharacterBody2D, delta: float):
	if body.velocity.y > 0:
		body.animation_player.play("fall")
	elif body.velocity.y < 0:
		body.animation_player.play("jump")
		
	if Input.is_action_just_pressed("jump") and body.is_on_floor():
		body.velocity.y += JUMP_VELOCITY
		can_double_jump = true
		
	if !body.is_on_floor():
		if Input.is_action_just_pressed("jump") and can_double_jump:
			body.velocity.y = JUMP_VELOCITY
			can_double_jump = false
		else:
			body.velocity.y += gravity * delta
