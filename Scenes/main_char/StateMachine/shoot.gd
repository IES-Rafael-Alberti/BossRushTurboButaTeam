extends State
var current_force:Vector2 = Vector2(0,0)

func enter(_msg := {}) -> void:
	current_force = owner.min_shoot_range
	print("enter_shoot") #FIXME print
	owner.sprite.play("tirachinas")

func update(delta) -> void:
	if Input.is_action_pressed("shoot"):
		if current_force+owner.force_by_frame<owner.max_shoot_range:
			current_force += owner.force_by_frame
			owner.shoot_bar.value = (current_force - owner.min_shoot_range).length() / (owner.max_shoot_range - owner.min_shoot_range).length() * 100.0
	elif Input.is_action_just_released("shoot"):
		state_machine.transition_to("Idle")

func exit() -> void:
	generate_arrow(current_force)

func generate_arrow(force:Vector2) -> void:
	var arrow:RigidBody2D = load("res://Scenes/main_char/bullet/arrow.tscn").instantiate()
	arrow.global_position = owner.attack_area.global_position
	add_child(arrow)
	arrow.apply_impulse(force)
	owner.shoot_bar.value = 0
	print(force) #FIXME print
