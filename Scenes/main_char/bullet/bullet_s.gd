extends Area2D

@export var damage_multiplier = 1
var charge_progress = 0
@export var speed = 50
var direction = 1

func _ready() -> void:
	if direction<0:
		scale.x = -(scale.x)
func _process(delta: float) -> void:
	global_position.x += 100*direction


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("process_attack"):
		body.process_attack(round(damage_multiplier*charge_progress))
		queue_free()
