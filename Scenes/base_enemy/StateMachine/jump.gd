extends State


func enter(_msg := {}) -> void:
	owner.velocity.y = owner.jump_force
	state_machine.transition_to("Idle")

func exit():
	pass
