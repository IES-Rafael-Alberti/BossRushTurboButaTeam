extends State

var walk_speed = 300.0

func enter(_msg := {}) -> void:
	print("walk ON")

func update(_delta:float) -> void:
	if (owner.global_position.x - owner.player.global_position.x) <= owner.jump_distance:
		state_machine.transition_to("Jump")
	print(owner.global_position)
	var direction = (owner.player.global_position - owner.global_position).normalized()
	owner.global_position += direction * walk_speed * _delta

func exit() -> void:
	print("Walk OFF")
