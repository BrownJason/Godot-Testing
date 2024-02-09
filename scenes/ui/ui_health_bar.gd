extends Control

@export var player: Player
@onready var texture_progress_bar = $MarginContainer/TextureProgressBar
@onready var health_label = $MarginContainer/TextureProgressBar/HealthLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	texture_progress_bar.value = player.health_comp._health
	texture_progress_bar.max_value = player.health_comp._max_health
	health_label.text = str(texture_progress_bar.value) + "/" + str(texture_progress_bar.max_value)
	player.connect("adjust_ui_health", adjust_ui_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func adjust_ui_health(_health):
	texture_progress_bar.value = _health
	health_label.text = str(texture_progress_bar.value) + "/" + str(texture_progress_bar.max_value)
