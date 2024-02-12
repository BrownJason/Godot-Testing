class_name Pickup
extends Area2D

var coin: PickupInfo
var health: PickupInfo

var pickup_list: Array

var pickup_dropped: PickupInfo = null

var player: Player

func _ready():
	coin = load("res://resources/coins_pickup.tres")
	health = load("res://resources/health_pickup.tres")
	
	pickup_list.append(coin)
	pickup_list.append(health)
	
	pickup_dropped = pick_random_pickup()
	
	var sprite = Sprite2D.new()
	sprite.texture = pickup_dropped.sprite
	add_child(sprite)
	
	var collision = CollisionShape2D.new()
	collision.shape = CircleShape2D.new()
	add_child(collision)
	
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self,"position", Vector2(position.x, position.y - 5), 0.5)
	tween.tween_property(self,"position", Vector2(position.x, position.y + 5), 0.5)

func pick_random_pickup() -> PickupInfo:
	return pickup_list[randi_range(0, pickup_list.size() - 1)]

func _on_body_entered(body):
	if body is Player:
		player = body
		if pickup_dropped == coin:
			ScoreManager.set_score(pickup_dropped.value)
		else:
			player.health_comp.heal(pickup_dropped.value)
			
		call_deferred("die")
		
func die():
	queue_free()
