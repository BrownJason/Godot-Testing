extends Area2D

func _on_body_entered(body):
	if body is Player:
		body.can_climb = true
		body.set_collision_layer_value(1, false)
		
func _on_body_exited(body):
	if body is Player:
		body.can_climb = false
		body.set_collision_layer_value(1, true)
