extends Area2D

@onready var tomato_spawner_timer: Timer = $tomato_spawner_timer
@export var tomato_spawning_enabled = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_manager.tomatoes_on.connect(tomatoes_onf)
	game_manager.tomatoes_off.connect(tomatoes_offf)
func spawn_tomato():
	print("spawned tomato")
	var tomato = preload("res://Scenes/tomato.tscn").instantiate()
	add_child(tomato)
	tomato.global_position.x = randi_range(0,1150)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_tomato_spawner_timer_timeout() -> void:
	if tomato_spawning_enabled:
		spawn_tomato()

func tomatoes_onf():
	tomato_spawning_enabled=true
func tomatoes_offf():
	tomato_spawning_enabled=false
