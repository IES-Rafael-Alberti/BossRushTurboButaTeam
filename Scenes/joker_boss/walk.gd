extends State

func handle_input(_event:InputEvent) -> void:
	pass

func update(_delta:float) -> void:
	owner.global_position.x -= (owner.direction * owner.speed * _delta).x
	if owner.global_position.distance_to(owner.player.global_position) > owner.safe_distance:
		state_machine.transition_to("Attack")

func physics_update(_delta:float) -> void:
	pass

func enter(_msg := {}) -> void:
	pass

func exit() -> void:
	pass
