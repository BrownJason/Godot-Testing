class_name BaseEnemy
extends CharacterBody2D

@export var health_comp: HealthComponent
@export var damage_comp: DamageComponent
@export var move_comp: MovementComponent

var player: Player
@onready var sprite_2d = $Sprite2D
@onready var damage_label = $DamageLabel
var body_within_attack_range: bool = false

signal facing_dir_changed(facing_right: bool)

func _ready():
	damage_label.value = health_comp._health
	damage_label.max_value = health_comp._health

func _process(delta):
	velocity = Vector2.ZERO
	if player and global_position.distance_to(player.global_position) > 40:
		move_comp.enemy_chase(self, player, delta)
		velocity.y = 0
		
	
	if velocity.x != 0 and !player:
		move_toward(velocity.x, 0.0, delta)
	
	move_and_slide()
	update_facing_dir()
	
	if body_within_attack_range and player != null:
		damage_comp.deal_damage_on_hit(player)

func update_facing_dir():
	if velocity.x < 0:
		sprite_2d.flip_h = false
		emit_signal("facing_dir_changed", false)
	if velocity.x > 0:
		sprite_2d.flip_h = true
		emit_signal("facing_dir_changed", true)

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
