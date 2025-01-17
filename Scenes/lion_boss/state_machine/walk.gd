extends State

var walk_speed = 300.0

func enter(_msg := {}) -> void:
	print("walk ON")

func update(_delta:float) -> void:
	if owner.player.is_on_floor() && owner.global_position.distance_to(owner.player.global_position) < owner.jump_distance && owner.global_position.distance_to(owner.player.global_position) > owner.walk_distance:
		state_machine.transition_to("Jump")
	#var direction = (owner.player.global_position - owner.global_position).normalized()
	owner.global_position += owner.direction * walk_speed * _delta
	print(walk_speed)

func exit() -> void:
	print("Walk OFF")
