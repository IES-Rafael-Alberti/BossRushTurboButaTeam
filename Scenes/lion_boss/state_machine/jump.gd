extends State

var is_jumping = false

func enter(_msg := {}) -> void:
	jump()
	print("Jump ON")

func jump():
	is_jumping = true
	owner.velocity.y = owner.jump_force
	
func transtions():
	if owner.is_on_floor():
		is_jumping = false
		if owner.global_position.distance_to(owner.player.global_position) < owner.walk_distance:
			state_machine.transition_to("Walk")
		#else:
			#state_machine.transition_to("Idle")


func update(_delta:float) -> void:
	if is_jumping:
		var direction = (owner.player.global_position - owner.global_position).normalized()
		#owner.global_position.x += owner.speed *sign(direction.x)* _delta
		owner.global_position.x = owner.player.global_position.x
	transtions()
	#owner.global_position += direction * walk_speed * _delta


func exit() -> void:
	print("Jump OFF")
