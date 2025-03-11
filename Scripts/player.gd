extends CharacterBody2D
var salto = 0
var muerte_scene = load("res://Scenes/death.tscn")
const SPEED = 200
const JUMP_VELOCITY = -300
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump. *Poner esto de vuelta en la siguiente línea:  
	if Input.is_action_just_pressed("ui_accept") and salto < 1:
		velocity.y = JUMP_VELOCITY
		salto = salto + 1
	if is_on_floor():
		salto = 0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == 1:
		$anim.flip_h=false
	elif direction == -1:
		$anim.flip_h=true
	if direction == -1 || direction == 1:
		$anim.play("walk")
		pass
	if direction == 0:
		$anim.play("default")
		pass
	move_and_slide()
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider and collider.is_in_group("Enemigos"):
			var normal = collision.get_normal()
			if normal.y < 0:  
				collider.queue_free() 
				velocity.y = -250 
				get_parent().get_node("player/Muerte").play(0.5)
				# and normal.x == 1 or normal.y == 0 and normal.x == -1
			if round(normal.y) == 0 and abs(normal.x) > 0: 
				get_tree().change_scene_to_packed(muerte_scene) 
