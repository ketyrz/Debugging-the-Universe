extends Control

func _on_botao_tela_inicial_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/TelaInicial.tscn")

func _on_botao_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Fase1.tscn")
