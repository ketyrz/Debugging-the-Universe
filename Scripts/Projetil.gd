extends Area2D

var speed = 400

func _process(delta):
	position.y -= speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Inimigo":
		area.queue_free()
		queue_free()
