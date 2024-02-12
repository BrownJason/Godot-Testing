class_name Snail
extends BaseEnemy

@onready var ray_cast_2d = $RayCast2D

var dir: float

func _ready():
	stats = load("res://resources/snail.tres")
	
	health_comp._health = stats.health
	health_comp._max_health = stats.health
	damage_comp._damage_amount = stats.damage
	move_comp.speed = stats.speed
	sprite_2d.texture = stats.sprite
	
	dir = 1

func _physics_process(delta):
	move_comp.enemy_wander(self, dir)
	anim_comp.handle_snail_move_animation(velocity.x)
	
	move_and_slide()
	
	if position.x <= 10:
		position.x = 10
		
	if health_comp._health <= 0.0:
		call_deferred("queue_free")

func take_damage(damage):
	health_comp.take_damage(damage)

func _on_area_2d_body_entered(body):
	player = body

func _on_area_2d_body_exited(body):
	player = null

func _on_hit_box_body_entered(body):
	damage_comp.deal_damage_on_hit(body)

func _on_hit_box_body_exited(body):
	if body == player:
		body_within_attack_range = false

func _on_hurt_box_body_entered(body):
	if body is Player and body.velocity.y > 0:
		take_damage(body.damage_comp._damage_amount)
