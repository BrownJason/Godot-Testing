class_name  MovementComponent
extends Node

@export_category("Movement Info")
@export var speed: int = 300

func _physics_process(delta):
	pass
	
# Player movment functions
func player_movement(delta: float, body: CharacterBody2D, animation_player: AnimationPlayer):
	body.velocity.x = 0
	var direction := Vector2(0,0)
	direction.x = Input.get_axis("move_left","move_right")
	
	if direction.x > 0:
		body.velocity.x += speed
	if direction.x < 0:
		body.velocity.x -= speed
	
	if body.velocity.x != 0 and body.is_on_floor():
		animation_player.play("run")
	elif body.is_on_floor() and !body.is_hurt:
		animation_player.play("idle")
		
	update_facing_dir(body)

func update_facing_dir(body: CharacterBody2D):
	if body.velocity.x < 0:
		body.sprite_2d.flip_h = true
		body.emit_signal("facing_dir_changed", !body.sprite_2d.flip_h)
	if body.velocity.x > 0:
		body.sprite_2d.flip_h = false
		body.emit_signal("facing_dir_changed", !body.sprite_2d.flip_h)

# Enemy Movement functions
func enemy_chase(body, target, delta):
	body.velocity = body.global_position.direction_to(target.global_position) * speed
