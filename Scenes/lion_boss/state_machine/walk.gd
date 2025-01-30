extends State

var walk_speed = 300.0

func enter(_msg := {}) -> void:
	#Reset del timer de salto
	owner.jumpTime = 0
	owner.sprite.play("andar")
func update(_delta:float) -> void:
	if owner.player.is_on_floor() && owner.global_position.distance_to(owner.player.global_position) < owner.jump_distance && owner.global_position.distance_to(owner.player.global_position) > owner.walk_distance:
		state_machine.transition_to("Jump")
	owner.global_position.x += (owner.direction * walk_speed * _delta).x

func exit() -> void:
	pass
