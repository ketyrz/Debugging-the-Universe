extends Area2D

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Foguete":
		get_tree().change_scene_to_file("res://Scenes/Vitoria.tscn")
