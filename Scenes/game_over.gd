extends Control

func _ready():
	get_tree().paused = true
	retry_button.grab_focus()

@onready var retry_button = $RetryButton
@onready var quit_button = $QuitButton

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

 
func _on_retry_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_scene/main_scene.tscn")
	


func _on_quit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
