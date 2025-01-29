extends State

func update(_delta:float) -> void:
	if owner.is_on_floor():
		state_machine.transition_to("Idle")
