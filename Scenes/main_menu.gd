extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = $PlayButton
@onready var menu_button: Button = $MenuButton
@onready var credit_button: Button = $CreditButton


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("fade_in")

func _on_play_button_pressed():
	play_button.disabled = true
	menu_button.disabled = true
	credit_button.disabled = true
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/lion_boss/lion_fight_proto.tscn")

func _on_menu_button_pressed():
	play_button.disabled = true
	menu_button.disabled = true
	credit_button.disabled = true
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/options.tscn")

func _on_credit_button_pressed():
	play_button.disabled = true
	menu_button.disabled = true
	credit_button.disabled = true
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
