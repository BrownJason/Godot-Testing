class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: Sprite2D
@export var anim_player: AnimationPlayer

func handle_horizontal_flip(move_direction: float):
	if move_direction == 0:
		return
		
	sprite.flip_h = false if move_direction > 0 else true

func handle_move_animation(move_direction: float):
	handle_horizontal_flip(move_direction)
	
	if move_direction != 0:
		anim_player.play("run")
	else:
		anim_player.play("idle")

func handle_jump_animation(is_jumping: bool, is_falling: bool):
	if is_jumping:
		anim_player.play("jump")
	elif is_falling:
		anim_player.play("fall")

func handle_hurt_animation(is_hurt: bool):
	if is_hurt:
		anim_player.play("hurt")
