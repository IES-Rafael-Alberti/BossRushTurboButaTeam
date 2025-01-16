extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var escape_distance = 200

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _process(delta):
	var target_pos = (main_char.position - position).normalized()
	print(main_char.velocity)
	#print(position.distance_to(main_char.position))
	if position.distance_to(main_char.position) > escape_distance:
		move_toward(position.x,target_pos.x,SPEED)
