class_name  MovementComponent
extends Node

@export_subgroup("Settings")
@export var speed: float = 300.0
@export var ground_accel: float = 6.0
@export var ground_decel: float = 8.0
@export var air_accel: float = 10.0
@export var air_decel: float = 3.0


# Player movment functions
func player_movement(body: CharacterBody2D, direction: float):
	var velocity_change_speed: float = 0.0
	if body.is_on_floor():
		velocity_change_speed = ground_accel if direction != 0 else ground_decel
	else:
		velocity_change_speed = air_accel if direction != 0 else air_decel
	
	body.velocity.x = move_toward(body.velocity.x, direction * speed, velocity_change_speed)

# Enemy Movement functions
func enemy_wander(body: CharacterBody2D, direction: float):
	if body.is_on_floor():
		if body.is_on_wall() || !body.ray_cast_2d.is_colliding():
			body.dir = -body.dir
			body.ray_cast_2d.position.x = body.ray_cast_2d.position.x * -1
	
	body.velocity.x = speed * direction
