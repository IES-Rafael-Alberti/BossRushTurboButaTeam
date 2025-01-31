extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var play_button = $PlayButton
@onready var credit_button = $CreditButton



# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("fade_in")
	play_button.grab_focus()

func _on_play_button_pressed():
	play_button.disabled = true
	credit_button.disabled = true
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/main_scene/main_scene.tscn")


func _on_credit_button_pressed():
	play_button.disabled = true
	credit_button.disabled = true
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
