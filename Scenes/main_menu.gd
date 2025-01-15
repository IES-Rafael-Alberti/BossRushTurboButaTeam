extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_play_button_pressed():
	print("hola")
	get_tree().change_scene_to_file("res://Scenes/cambio_escena.tscn")

func _on_menu_button_pressed():
	print("puto")
	get_tree().change_scene_to_file("res://Scenes/options.tscn")

func _on_credit_button_pressed():
	print("eduputo")
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
