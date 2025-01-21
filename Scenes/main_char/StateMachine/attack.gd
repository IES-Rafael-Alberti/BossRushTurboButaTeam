extends State

func enter(_msg := {}) -> void:
	attack()
	state_machine.transition_to("Idle")

func attack():
	var enemies_in_attack_area = owner.attack_area.get_overlapping_bodies()
	if enemies_in_attack_area.size()>0:
		for enemy in enemies_in_attack_area:
			if enemy.has_method("process_attack"):
				enemy.process_attack(owner.attack_damage)
	else:
		print("failed attack") #FIXME print
