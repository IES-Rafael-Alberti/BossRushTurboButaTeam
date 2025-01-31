extends State

func enter(_msg := {}) -> void:
	owner.sprite.play("salto")

func update(_delta:float) -> void:
	if owner.is_on_floor():
		state_machine.transition_to("Idle")
