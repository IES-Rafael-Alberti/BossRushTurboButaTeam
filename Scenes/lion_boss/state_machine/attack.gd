extends State

#Es importante dentro de los estados acceder las variables con "Access as unique name" (este simbolito %)
#porque como busques algo con $"../../ muerte
@onready var attack_area = %AttackArea
@onready var attack_cooldown = %AttackCooldown

func enter(_msg := {}) -> void:
	#Al entrar en el estado, empezamos el reloj para que cada vez que este salte pegue. (el tiempo está en el timer, wait_time)
	attack_cooldown.start()

func update(_delta:float) -> void:
	#Por cada frame, comprobamos si no hay cuerpos en la zona de ataque para pasar a "Idle"
	if not attack_area.has_overlapping_bodies():
		state_machine.transition_to("Idle")

#Cuando salte el reloj, atacamos.
func _on_attack_cooldown_timeout():
	attack_player()

func attack_player():
	#cogemos todos los cuerpos en el área de ataque
	var bodies = attack_area.get_overlapping_bodies()
	#si hay más de uno (es decir, si hay)
	if bodies.size()>0:
		#por cada cuerpo en el array "Bodies":
		for body in bodies:
			#Si este cuerpo tiene el método "process_attack" (esto hace que el juego no pete pidiendo un método a un cuerpo que no lo tiene)
			if body.has_method("process_attack"):
				body.animation_player.play("dano")
				#le atacamos, con el daño del owner de este estado y le empujamos.
				body.process_attack(owner.attack_damage)
				var push_direction = (owner.direction + Vector2(0,-1)).normalized()
				body.velocity += push_direction * owner.push_strength
	#Volvemos a iniciar el reloj de ataque.
	attack_cooldown.start()

func exit() -> void:
	pass
