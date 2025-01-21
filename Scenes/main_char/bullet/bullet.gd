extends RigidBody2D

@export var damage = 50
#@export var initial_force: Vector2 = Vector2(300,-1000)
func _ready():
	pass
	#apply_impulse(initial_force)

func _process(delta):
	pass
	#position.x += 2 #HACK tremendo
func _physics_process(delta):
	pass

func _on_body_entered(body):
	if body.has_method("process_attack"):
		body.process_attack(damage)
		queue_free()
