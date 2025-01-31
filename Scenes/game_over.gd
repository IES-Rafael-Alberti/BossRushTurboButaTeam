extends Control

@onready var retry_button = $RetryButton
@onready var quit_button = $QuitButton


func _ready():
	retry_button.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/cambio_escena.tscn")
	


func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
