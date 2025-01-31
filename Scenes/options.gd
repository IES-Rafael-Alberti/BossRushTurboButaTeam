extends Control

@onready var master_slider = $GridContainer/MasterSlider
@onready var music_slider = $GridContainer/MusicSlider
@onready var sfx_slider = $GridContainer/sfxSlider
@onready var window_mode = $GridContainer/windowMode
@onready var language = $GridContainer/Language
@onready var label_4 = $GridContainer/Label4

func _ready() -> void:
	var locale = TranslationServer.get_locale()
	if locale == "en":
		language.select(0)
	elif locale == "es":
		language.select(1)
	if OS.get_name()=="Web":
		label_4.hide()
		window_mode.hide()
	else:
		window_mode.select(DisplayServer.window_get_mode()-1)
		


func _on_idioma_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_window_mode_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
