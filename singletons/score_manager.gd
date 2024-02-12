extends Node

var score: int = 0
var enemies: int = 0
var max_enemies: int = 0


func set_score(v: int):
	score += v
	
func get_score() -> int:
	return score

func set_enemies(v: int):
	enemies += v
	
func get_enemies() -> int:
	return enemies
	
func set_max_enemies(v: int):
	max_enemies += v
	
func get_max_enemies() -> int:
	return max_enemies
