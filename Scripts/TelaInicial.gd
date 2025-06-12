extends Control

func _on_botao_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Fase1.tscn")

func _on_botao_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/TelaTutorial.tscn")

func _on_botao_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/TelaCreditos.tscn")
