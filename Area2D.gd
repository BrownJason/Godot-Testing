extends Area2D
@onready var crank_down = $CrankDown
@onready var crank_up = $CrankUp

var is_visible: bool = false
var player: Player
var moving_platform: MovingPlatform

func _ready():
	crank_up.visible = !is_visible
	crank_down.visible = is_visible
	
	moving_platform = get_parent().get_node("MovingPlatform")

func _process(delta):	
	if Input.is_action_just_pressed("interact"):
		crank_up.visible = !crank_up.visible
		crank_down.visible = !crank_up.visible
		
		if crank_down.visible:
			SceneManager.set_platform_active(true)
			moving_platform.set_moving()
		else:
			SceneManager.set_platform_active(false)
			
		

func _on_body_entered(body):
	if body is Player:
		player = body
	
