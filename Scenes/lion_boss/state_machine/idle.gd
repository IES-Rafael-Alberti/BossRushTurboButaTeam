extends State
#Referenciamos el área de ataque
@onready var attack_area = %AttackArea

func enter(_msg := {}) -> void:
	owner.sprite.stop()

func update(_delta:float) -> void:
	if owner.global_position.distance_to(owner.player.global_position) < owner.walk_distance || owner.global_position.distance_to(owner.player.global_position) > owner.jump_distance:
		state_machine.transition_to("Walk")
	elif owner.player.is_on_floor() && owner.global_position.distance_to(owner.player.global_position) < owner.jump_distance && owner.global_position.distance_to(owner.player.global_position) > owner.walk_distance:
		state_machine.transition_to("Jump")

#Si un cuerpo entra en el área de ataque, la máquina de estados nos lleva a "Attack"
func _on_attack_area_body_entered(body):
	state_machine.transition_to("Attack")

func exit() -> void:
	pass
