extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#global_position = randi_range(0,1150)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += game_manager.tomato_falling_speed


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("process_attack"):
		body.process_attack(game_manager.tomato_damage)
		queue_free()
