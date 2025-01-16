extends State

var jump_force = Vector2(0, -300)
var is_jumping = false

func enter(_msg := {}) -> void:
	is_jumping = true
	owner.speed = jump_force
	print("Jump ON")

func update(_delta:float) -> void:
	if is_jumping:
		owner.global_position += owner.speed * _delta
	if owner.is_on_floor():
		is_jumping = false
		if owner.global_position.distance_to(main_char.global_position) > owner.walk_distance:
			state_machine.transition_to("Walk")
		else:
			state_machine.transition_to("Idle")

func exit() -> void:
	print("Jump OFF")
