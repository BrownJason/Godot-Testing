extends Node

const TOTAL_LEVELS: int = 2
const MAIN_SCENE: PackedScene = preload("res://scenes/main/main.tscn")

var plat_form_activated: bool = false

var _current_level: int = 0

var _level_scenes = {
}

func _ready():
	init_level_scense()
	ScoreManager.reset_score()
	
	
func init_level_scense() -> void:
	for ln in range(1, TOTAL_LEVELS + 1):
		_level_scenes[ln] = load("res://scenes/level/level_%s.tscn" % ln)
		
func load_main_scene() -> void:
	_current_level = 0
	ScoreManager.reset_score()
	get_tree().change_scene_to_packed(MAIN_SCENE)

func load_next_level_scene() -> void:
	set_next_level()
	ScoreManager.get_score()
	ScoreManager.reset_enemies()
	get_tree().change_scene_to_packed(_level_scenes[_current_level])

func set_next_level() -> void:
	_current_level += 1
	if _current_level > TOTAL_LEVELS:
		_current_level = 1

func set_platform_active(active: bool):
	plat_form_activated = active
	
func get_active_platform() -> bool:
	return plat_form_activated
