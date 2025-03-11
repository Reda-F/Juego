extends CharacterBody2D

var salto = 0
var muerte_scene = preload("res://Scenes/menu_principal.tscn")
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta

	# Manejo del salto
	if Input.is_action_just_pressed("ui_accept") and salto < 1:
		velocity.y = JUMP_VELOCITY
		salto += 1

	if is_on_floor():
		salto = 0

	# Movimiento horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 2, SPEED)

	# Animaciones
	if direction == 1:
		$anim.flip_h = false
	elif direction == -1:
		$anim.flip_h = true

	if direction != 0:
		$anim.play("walk")
	else:
		$anim.play("default")

	# Detectar colisiones con enemigos
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("enemigos"):
			var normal = collision.get_normal()
			if normal.y < 0:  # Si el jugador cae sobre el enemigo
				collider.queue_free()  # Elimina al enemigo
				velocity.y = -200  # Rebote
			else:  # Si choca de lado o desde abajo
				get_tree().change_scene_to_packed(muerte_scene)

	move_and_slide()
