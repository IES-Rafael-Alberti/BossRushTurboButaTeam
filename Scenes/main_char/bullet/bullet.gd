extends CharacterBody2D

@export var damage = 50

func _ready():
	pass

func _process(delta):
	position.x += 2 #HACK tremendo
func _physics_process(delta):
	velocity += get_gravity() * delta

func _on_body_entered(body):
	if body.has_method("process_attack"):
		body.process_attack(damage)
		queue_free()
