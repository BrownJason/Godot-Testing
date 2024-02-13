class_name HealthComponent
extends Node

# What goes with health?
# Health Amount
# Damage?
# Display?

var pickup = preload("res://scenes/pickup/dropped_pickup.tscn")
var explosion = preload("res://scenes/asset_scenes/explosion.tscn")

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
	_health -= damage
	if _health <= 0:
		call_deferred("die")
		
# Kill the entity
func die() -> void:
	if get_parent() is Snail: # Change later to any enemy or is_in_group("enemy")
		var new_pickup = pickup.instantiate()
		new_pickup.global_position = get_parent().global_position
		get_parent().get_parent().add_child(new_pickup)
		
		var new_exp = explosion.instantiate()
		new_exp.global_position = get_parent().global_position
		get_parent().get_parent().add_child(new_exp)
	
# Heal for a set amount, no more than max health
func heal(heal_amount: float) -> void:
	_health += heal_amount
	if _health >= _max_health:
		_health = _max_health

# Increase health on level up
func increase_health_on_levelup() -> void:
	_max_health *= 1.1
	if _can_heal_on_level_up:
		_health = _max_health
