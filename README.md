Learning Godot and pushing what I learn

Basic 2D Platformer 

What's in this:

- Health Component
  -  Controls the health of the entity / object, no matter if enemy or player. It is independent of each other as it is a node you connect to the player / enemy
  -  Take damage and subtract the health
 
- Damage Component
  -  Controls the damage portion of the object. Currenlty only has amount and how often they can deal damage
 
- Movement Component
  - Has basic movement, excluding flipping of the sprite
  - Player movement is controlled by a func which takes in delta and body (Player)
  - Enemy has a basic chase func that takes is the body (Enemy), target (Player) and delta
  - As this is just a baisc Node, it doesn't have the is_on_floor() for doing checks for jumping, this is done in the player _physics_process
  - ```
    func _physics_process(delta):
      if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y += move_comp.JUMP_VELOCITY
        
      move_comp.player_movement(delta, self)
      
      if enemy and Input.is_action_just_pressed("attack"):
        damage_comp.deal_damage_on_hit(enemy)
      
      move_and_slide()
      update_facing_dir()
    ```
<img src="https://github.com/BrownJason/Godot-Testing/blob/main/2d-platform-sample.gif" width="760" height="480"/>

  - Separate UI health bars for enemy and player as Progress Bars
    - Player Health is on canvas layer
    - Enemy Health is disaplyed above their head
   

More feature's coming as I learn more about the engine.
