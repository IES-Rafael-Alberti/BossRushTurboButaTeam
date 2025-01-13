extends State

## Se ejecuta al entrar en el estado
func enter(_msg := {}) -> void:
	state_machine.transition_to("Attacking")

## Se ejecuta al salir del estado
func exit() -> void:
	pass
