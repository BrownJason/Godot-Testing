extends Control

func _on_resume_button_pressed():
	get_parent().set_physics_process(true)
	hide()
	get_tree().paused = false

func _on_quit_button_pressed():
	call_deferred("main_menu")

func main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_packed(load("res://scenes/main/main.tscn"))
