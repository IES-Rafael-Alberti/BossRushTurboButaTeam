extends State

var last_dir:int
func physics_update(_delta:float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("Jump")
	if direction:
		owner.velocity.x = direction * owner.SPEED
		last_dir = sign(direction)
		print("bool da",boolean_to_number(owner.facing))
		if last_dir != boolean_to_number(owner.facing):
			owner.facing = !owner.facing
			owner.scale.x *= -1
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, owner.SPEED)
	if owner.velocity == Vector2(0,0):
		state_machine.transition_to("Idle")

#func exit() -> void:
	##print(last_dir)
	#owner.facing = last_dir > 0
	#owner.scale.x *= last_dir

func boolean_to_number(value: bool) -> int:
	return 1 if value else -1
	
