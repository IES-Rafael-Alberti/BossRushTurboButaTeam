extends State

#TODO Cambiar var al boss & lo de la función dentro de enter tambien YEY 
func enter(_msg := {}) -> void:
	pass
	
func update(_delta:float) -> void:
	teleport(Vector2(owner.player.global_position.x - 150, owner.player.global_position.y))
	prepare_next_tp()
	state_machine.transition_to("Idle")

func teleport(destination: Vector2):
	owner.global_position = destination

func prepare_next_tp():
	#owner.next_tp_time = randf_range(owner.min_tp_time, owner.max_tp_time)
	owner.time_since_last_tp = 0.0
