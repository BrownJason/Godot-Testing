class_name  MovementComponent
extends Node

const JUMP_VELOCITY: int = -325

@export_category("Movement Info")
@export var speed: int = 300
@export var gravity = 800
var velocity := Vector2.ZERO

func _physics_process(delta):
	pass
	
func player_movement(delta, body):
	body.velocity.y += gravity * delta
	body.velocity.x = 0
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left","move_right")
	
	if direction.x > 0:
		body.velocity.x += speed
	if direction.x < 0:
		body.velocity.x -= speed

func enemy_chase(body, target, delta):
	body.velocity = body.global_position.direction_to(target.global_position) * speed
