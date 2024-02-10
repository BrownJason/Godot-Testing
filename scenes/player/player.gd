class_name Player
extends CharacterBody2D

@export var health_comp: HealthComponent
@export var damage_comp: DamageComponent
@export var move_comp: MovementComponent
@export var jump_comp: JumpComponent

@onready var sprite_2d = $Sprite2D
@onready var cooldown_timer = $DamageComponent/CooldownTimer
@onready var hit_box_component = $HitBoxComponent
@onready var animation_player = $AnimationPlayer
@onready var hurt_timer = $HurtTimer
@onready var facing_collision_shape = $HitBoxComponent/FacingCollisionShape

signal facing_dir_changed(facing_right: bool)
signal adjust_ui_health(health: float)

var enemy= null
var is_hurt: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("adjust_ui_health", health_comp._health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_comp.player_movement(delta, self, animation_player)
	jump_comp.player_jump(self, delta)
	
	if enemy != null and Input.is_action_just_pressed("attack"):
		damage_comp.deal_damage_on_hit(enemy)

	move_and_slide()

func _on_hit_box_component_body_entered(body):
	enemy = body

func _on_hit_box_component_body_exited(body):
	if body == enemy:
		enemy = null

func take_damage(damage):
	health_comp.take_damage(damage)
	emit_signal("adjust_ui_health", health_comp._health)
	animation_player.play("hurt")
	hurt_timer.start()
	is_hurt = true
	facing_collision_shape.visible = false
	set_physics_process(false)

func _on_hurt_timer_timeout():
	is_hurt = false
	facing_collision_shape.visible = true
	set_physics_process(true)
