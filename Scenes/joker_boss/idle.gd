extends State

func enter(_msg := {}) -> void:
	owner.sprite.play("idle")

func update(_delta:float) -> void:
	if owner.global_position.distance_to(owner.player.global_position) < owner.safe_distance:
		state_machine.transition_to("Walk")
	else:
		state_machine.transition_to("Attack")
