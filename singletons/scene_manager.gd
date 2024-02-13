extends Node

var levels: Array =[
	load("res://scenes/main/main.tscn")
]

var plat_form_activated: bool = false

func set_platform_active(active: bool):
	plat_form_activated = active
	
func get_active_platform() -> bool:
	return plat_form_activated
