extends State

@onready var attack_sound: AudioStreamPlayer = $"../../AttackSound"

func enter(_msg := {}) -> void:
	attack()
	state_machine.transition_to("Idle")
	owner.sprite.play("espada")

func attack():
	var enemies_in_attack_area = owner.attack_area.get_overlapping_areas()
	attack_sound.play()
	if enemies_in_attack_area.size()>0:
		for enemy in enemies_in_attack_area:
			if enemy.get_parent().has_method("process_attack"):
				enemy.get_parent().process_attack(owner.attack_damage)
	else:
		print("failed attack") #FIXME print
