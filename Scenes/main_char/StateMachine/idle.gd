extends State

func enter(_msg:= {}):
	owner.velocity = Vector2(0,0)
	if owner.sprite.animation=="espada" or owner.sprite.animation=="recibir_danyo":
		await owner.sprite.animation_finished
		owner.sprite.play("idle")

func update(delta:float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("Jump")
	elif Input.is_action_just_pressed("attack"):
		state_machine.transition_to("Attack")
	elif Input.is_action_just_pressed("shoot"):
		state_machine.transition_to("Shoot")
	elif not owner.is_on_floor():
		state_machine.transition_to("Air")
	elif direction:
			state_machine.transition_to("Walk")
