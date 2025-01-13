extends State

## Se ejecuta al entrar en el estado
func enter(_msg := {}) -> void:
	await get_tree().create_timer(1)
	match randi() % 2:
		0:
			state_machine.transition_to("Attacking")
		1:
			await owner.is_on_floor()
			state_machine.transition_to("Jump")
## Se ejecuta al salir del estado
func exit() -> void:
	pass
