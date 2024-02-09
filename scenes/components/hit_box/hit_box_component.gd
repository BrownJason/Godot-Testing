extends Area2D

@export_category("Hit Box Info")
@export var player: Player
@export var facing_collision_dir: FacingCollisionShape

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("facing_dir_changed", _on_facing_collision_dir)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_facing_collision_dir(facing_right):
	if facing_right:
		facing_collision_dir.position = facing_collision_dir.facing_right_dir
	else:
		facing_collision_dir.position = facing_collision_dir.facing_left_dir
