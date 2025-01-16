extends Boss

@export_category("Joker Abilities")
@export var escape_distance = 200

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _process(delta):
	var target_pos = (player.position - position).normalized()
	#print(player.velocity)
	#print(position.distance_to(player.position)) #FIXME print
	if position.distance_to(player.position) > escape_distance:
		move_toward(position.x,target_pos.x,speed)
