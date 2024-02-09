class_name HealthComponent
extends Node

# What goes with health?
# Health Amount
# Damage?
# Display?

@export_group("Health Info")
## Current health of the entity.
## 
## This is set to be Max Health when first initializing the entity
@export var _health: float 
## Maximum health an entity can have
@export var _max_health: float 
## Set to true if the entity can heal when leveling up
@export var _can_heal_on_level_up: bool = false

# Set current health to max at start
func _ready():
	_health = _max_health

# Entity takes damage
func take_damage(damage: float)  -> void:
	print(damage)
	_health -= damage
	if _health <= 0:
		die()
		
# Kill the entity
func die() -> void:
	get_parent().set_physics_process(false)
	get_parent().queue_free()
	
# Heal for a set amount, no more than max health
func heal(heal_amount: float) -> void:
	_health += heal_amount
	if _health > _max_health:
		_health = _max_health

# Increase health on level up
func increase_health_on_levelup() -> void:
	_max_health *= 1.1
	if _can_heal_on_level_up:
		_health = _max_health
