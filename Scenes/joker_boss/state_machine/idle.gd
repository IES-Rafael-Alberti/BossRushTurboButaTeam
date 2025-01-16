extends State

func enter(_msg := {}) -> void:
	print("enter idle")

func update(_delta:float) -> void:
	print(main_char.global_position.x-owner.global_position.x)
	if (main_char.position.x-owner.global_position.x) <= owner.escape_distance:
		state_machine.transition_to("Walk")
