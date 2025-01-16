extends State

func enter(_msg := {}) -> void:
	print("enter idle") #FIXME print

func update(_delta:float) -> void:
	print("distance player-boss:",owner.player.global_position.x-owner.global_position.x) #FIXME print
	#Esta línea calcula el valor (absoluto) de distancia entre el jugador y el boss. 
	#si es menor a la distancia a la que se supone que el joker debe escapar, este transiciona al estado "Walk"
	if (abs(owner.player.position.x-owner.global_position.x)) <= owner.escape_distance:
		print("TRANSITION TO WALK") #FIXME print
		state_machine.transition_to("Walk")
