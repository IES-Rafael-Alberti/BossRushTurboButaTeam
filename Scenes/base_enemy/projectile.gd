extends Area2D

@export var damage = 50
@export var speed = 2

func _process(delta):
	position.x -= speed #TODO balas que persigan al jugador

func _on_body_entered(body):
	if body.has_method("process_attack"):
		body.process_attack(damage)
		queue_free()
