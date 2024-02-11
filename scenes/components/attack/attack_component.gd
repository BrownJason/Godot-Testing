class_name AttackComponent
extends Node

var bullet: PackedScene = preload("res://scenes/bullet/bullet.tscn")

@export var speed: float = 80.0
@export var life_span: float = 10.0
@export var shoot_cooldown_timer: Timer
var can_shoot = true

# Create a bullet that will move in direction you are facing when you
# hit the attack button
func _ready():
	shoot_cooldown_timer.timeout.connect(_on_shoot_cooldown_timer_timeout)

func create_bullet(_dir: Vector2, body):
	var new_bullet = bullet.instantiate()
	new_bullet.setup(_dir, life_span, speed, body.damage_comp._damage_amount)
	new_bullet.global_position = body.global_position
	add_child(new_bullet)
	
func shoot_bullet(facing_left: bool, body: CharacterBody2D):
	if Input.is_action_just_pressed("attack") and can_shoot:
		shoot_cooldown_timer.start()
		can_shoot = false
		
		if !facing_left:
			create_bullet(Vector2.RIGHT, body)
		else:
			create_bullet(Vector2.LEFT, body)

func _on_shoot_cooldown_timer_timeout():
	print("Can shoot again")
	can_shoot = true
