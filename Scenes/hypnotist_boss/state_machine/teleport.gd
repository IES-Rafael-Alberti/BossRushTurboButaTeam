extends State

var timer = 0.0
#TODO Cambiar var al boss & lo de la función dentro de enter tambien YEY 
func enter(_msg := {}) -> void:
	teleport(Vector2(owner.player.global_position.x - 150, owner.player.global_position.y))
	timer = 0
	
func update(_delta:float) -> void:
	timer += _delta
	print(timer)
	if timer >= 1.0:
		print("timer")
		attack_player()
		prepare_next_tp()
		state_machine.transition_to("Idle")

func teleport(destination: Vector2):
	owner.global_position = destination

func prepare_next_tp():
	#owner.next_tp_time = randf_range(owner.min_tp_time, owner.max_tp_time)
	owner.time_since_last_tp = 0.0

func attack_player():
	#cogemos todos los cuerpos en el área de ataque
	var bodies = owner.attack_area.get_overlapping_bodies()
	print(bodies)
	#si hay más de uno (es decir, si hay)
	if bodies.size()>0:
		#por cada cuerpo en el array "Bodies":
		for body in bodies:
			#Si este cuerpo tiene el método "process_attack" (esto hace que el juego no pete pidiendo un método a un cuerpo que no lo tiene)
			if body.has_method("process_attack"):
				#le atacamos, con el daño del owner de este estado y le empujamos.
				body.process_attack(owner.attack_damage)
