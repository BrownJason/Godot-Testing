class_name BaseEnemy
extends CharacterBody2D

@export var health_comp: HealthComponent
@export var damage_comp: DamageComponent
@export var move_comp: MovementComponent
@export var anim_comp: AnimationComponent

var player: Player
@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var damage_label = $DamageLabel

var body_within_attack_range: bool = false

var stats: EnemyStats = null

signal facing_dir_changed(facing_right: bool)

func _ready():
	health_comp._max_health = stats.health
	damage_comp._damage_amount = stats.damage
	move_comp.speed = stats.speed
	
	damage_label.value = health_comp._health
	damage_label.max_value = health_comp._health

func _process(delta):
	move_comp.enemy_chase(self, player, delta)
	
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
