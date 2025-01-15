extends State

func physics_update(_delta:float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("Jump")
	if direction:
		owner.velocity.x = direction * owner.SPEED
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, owner.SPEED)
