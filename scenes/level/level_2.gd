extends Node2D
@onready var player_spawner = $PlayerSpawner

#var player_health_bar: PackedScene = preload("res://scenes/ui/ui_health_bar.tscn")
#var enemies: int = 0

func _ready():
	player_spawner.create_player()
	#
	#create_health_bar_ui()
	#for snail in get_children():
		#if snail is Snail:
			#ScoreManager.set_max_enemies(1)
			#ScoreManager.set_enemies(1)
#
#func _process(delta):
	#enemies = get_children(is_in_group("snail")).size()
	#if Input.is_action_just_pressed("pause"):
		#get_node("CanvasLayer/PauseMenu").show()
		#get_tree().paused = true
#
#func create_health_bar_ui():
	#var new_health_bar = player_health_bar.instantiate()
	#get_node("CanvasLayer").add_child(new_health_bar)
