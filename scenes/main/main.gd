class_name MainMenu
extends Node

func _on_play_button_pressed():
	SceneManager.load_next_level_scene()

func _on_quit_button_pressed():
	get_tree().quit()
