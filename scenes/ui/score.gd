extends Control

@onready var score_label = $MarginContainer/PanelContainer/MarginContainer/GridContainer/ScoreLabel
@onready var enemy_label = $MarginContainer/PanelContainer/MarginContainer/GridContainer/EnemyLabel

var max_enemies: int

func _physics_process(delta):
	score_label.text = str(ScoreManager.get_score())
	enemy_label.text = str(ScoreManager.get_enemies()) + "/" + str(ScoreManager.get_max_enemies())
