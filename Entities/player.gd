extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0

func move():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x > 0:
		anim.flip_h = true
	elif velocity.x < 0:
		anim.flip_h = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("DeathZone"):
		call_deferred("ReloadScene")
	elif area.is_in_group("LevelEnd"):
		var next_level = area.next_level
		if next_level:
			call_deferred("LoadScene", next_level)
		else:
			push_error("Próxima fase não definida em end level")
	elif area.is_in_group("Enemy"):
		if velocity.y > 0: # O player matou o inimigo
			area.take_damage() # Deleta o inimigo
			go_to_jump_state()
		else:
			ReloadScene()

func ReloadScene():
	get_tree().reload_current_scene()

func LoadScene(SceneName: String):
	get_tree().change_scene_to_file("res://Scene/" + SceneName + ".tscn")
