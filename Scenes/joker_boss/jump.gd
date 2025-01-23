extends State

func enter(_msg := {}) -> void:
	owner.velocity.y -= owner.jump_force
	owner.velocity.x  += owner.direction.x * owner.jump_distance
	state_machine.transition_to("Air")
#func update(_delta:float) -> void:
	#owner.global_position.x += (owner.direction * owner.speed * _delta).x
	#if owner.is_on_floor:
		#state_machine.transition_to("Idle")
