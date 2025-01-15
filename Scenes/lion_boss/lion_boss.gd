extends CharacterBody2D

#propiedades del boss, exportadas para editarlas en runtime y más cómodamente
@export var speed = 300.0
@export var jump_force = -400.0
@export var attack_damage = 50

func _physics_process(delta):
	# Añade la gravedad.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Imprescindible para que el cuerpo procese físicas.
	move_and_slide()
