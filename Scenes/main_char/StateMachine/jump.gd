extends State

func enter(_msg := {}) -> void:
	owner.velocity.y = owner.JUMP_VELOCITY

func update(delta:float) -> void:
	state_machine.transition_to("Air")
