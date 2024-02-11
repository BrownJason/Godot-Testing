class_name Bullet
extends Area2D

var _dir: Vector2 = Vector2.RIGHT
var _life_span: float = 20.0
var _cur_life_span: float = 0.0
var _damage: float = 5

func _ready():
	pass
	
func _physics_process(delta):
	_cur_life_span += delta
	check_life_span()
	position += _dir * delta

func setup(dir: Vector2, life_span: float, speed: float, damage: float) -> void:
	_dir = dir.normalized() * speed
	_life_span = life_span
	_damage = damage
	
func check_life_span():
	if _cur_life_span >= _life_span:
		die()
	
func die():
	queue_free()

func _on_area_entered(area):
	area.get_parent().take_damage(_damage)
	call_deferred("die")
