extends CharacterBody2D

#propiedades del boss, exportadas para editarlas en runtime y más cómodamente
@export var speed = 300.0
@export var jump_force = -400.0
@export var attack_damage = 50
@export var jump_distance = 200.0
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight

func _process(delta):
	pass
	if ray_cast_left.is_colliding():
		print(ray_cast_left.get_collision_point())
	elif ray_cast_right.is_colliding():
		print(ray_cast_right.get_collision_point())
func _physics_process(delta):
	# Añade la gravedad.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Imprescindible para que el cuerpo procese físicas.
	move_and_slide()
