extends State

func enter(_msg := {}) -> void:
	print("enter_shoot") #FIXME print
	var arrow = load("res://Scenes/main_char/bullet/arrow.tscn").instantiate()
	arrow.global_position = owner.attack_area.global_position
	add_child(arrow)
	state_machine.transition_to("Idle")
