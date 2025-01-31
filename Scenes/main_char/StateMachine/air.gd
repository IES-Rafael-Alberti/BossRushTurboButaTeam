extends State

var last_dir:int
func update(_delta:float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if owner.is_on_floor():
		if direction:
			state_machine.transition_to("Walk")
		else:
			state_machine.transition_to("Idle")

func physics_update(_delta:float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	#if owner.velocity.y < 0:
		#owner.velocity.y *= owner.AIR_FRICTION
	if direction:
		owner.velocity.x = direction * owner.SPEED
		last_dir = sign(direction)
		if last_dir != boolean_to_number(owner.facing):
			owner.facing = !owner.facing
			owner.scale.x *= -1
#func exit() -> void:
	#print(last_dir)
	#owner.facing = last_dir > 0
	#owner.scale.x *= last_dir

func boolean_to_number(value: bool) -> int:
	return 1 if value else -1
