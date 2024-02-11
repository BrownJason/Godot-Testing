class_name Snail
extends BaseEnemy

func _ready():
	stats = load("res://resources/snail.tres")
	
	health_comp._max_health = stats.health
	damage_comp._damage_amount = stats.damage
	move_comp.speed = stats.speed
	sprite_2d.texture = stats.sprite
	
	damage_label.value = health_comp._health
	damage_label.max_value = health_comp._health

func _process(delta):
	anim_comp.handle_snail_move_animation(velocity.x)
	
	move_and_slide()
	
	if body_within_attack_range and player != null:
		damage_comp.deal_damage_on_hit(player)

func take_damage(damage):
	health_comp.take_damage(damage)
	damage_label.value = health_comp._health

func _on_area_2d_body_entered(body):
	player = body

func _on_area_2d_body_exited(body):
	player = null

func _on_hit_box_body_entered(body):
	if body == player:
		body_within_attack_range = true

func _on_hit_box_body_exited(body):
	if body == player:
		body_within_attack_range = false
