class_name Player
extends CharacterBody2D

@export var health_comp: HealthComponent
@export var damage_comp: DamageComponent
@export var move_comp: MovementComponent

@onready var sprite_2d = $Sprite2D
@onready var hit_box_component = $HitBoxComponent

signal facing_dir_changed(facing_right: bool)
signal adjust_ui_health(health: float)

var enemy= null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += move_comp.JUMP_VELOCITY
		
	move_comp.player_movement(delta, self)
	
	if enemy != null and Input.is_action_just_pressed("attack"):
		damage_comp.deal_damage_on_hit(enemy)
	elif Input.is_action_just_pressed("attack"):
		pass
	
	move_and_slide()
	update_facing_dir()

func update_facing_dir():
	if velocity.x < 0:
		sprite_2d.flip_h = true
		emit_signal("facing_dir_changed", !sprite_2d.flip_h)
	if velocity.x > 0:
		sprite_2d.flip_h = false
		emit_signal("facing_dir_changed", !sprite_2d.flip_h)

func _on_hit_box_component_body_entered(body):
	enemy = body

func take_damage(damage):
	health_comp.take_damage(damage)
	emit_signal("adjust_ui_health", health_comp._health)
