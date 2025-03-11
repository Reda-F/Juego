extends CharacterBody2D
var pared = 0
const SPEED = 55
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	get_node("anim").play("Enemigo")
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_wall():
		pared = pared + 1
	if pared > 1:
		pared = 0
	if pared == 1:
		get_node("anim").flip_h = true
	elif pared == 0:
		get_node("anim").flip_h = false
	var Sentido_de_la_imagen = get_node("anim").is_flipped_h()
	if Sentido_de_la_imagen == true:
		velocity.x = SPEED
	else:
		velocity.x = -1 * SPEED
	
	move_and_slide()
	pass
