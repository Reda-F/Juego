extends CharacterBody2D
var salto = 0

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

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
