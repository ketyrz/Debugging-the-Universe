extends CharacterBody2D

var projectile_scene = preload("res://Entities/Projetil.tscn")
var can_shoot = true
var shoot_cooldown = 0.5
var shoot_timer = 0.0
var speed = 200

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	velocity = direction.normalized() * speed
	move_and_slide()

	# Tiro
	if Input.is_action_pressed("space") and can_shoot:
		shoot()
		can_shoot = false
		shoot_timer = shoot_cooldown

	if not can_shoot:
		shoot_timer -= delta
		if shoot_timer <= 0:
			can_shoot = true

func shoot():
	var proj = projectile_scene.instantiate()
	proj.position = position
	get_parent().add_child(proj)
	
