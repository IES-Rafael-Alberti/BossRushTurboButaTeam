extends State
@onready var projectile_generator = %ProjectileGenerator
@onready var attack_timer = %Attack_Timer
var times_attacked = 0
func enter(_msg := {}):
	times_attacked = 0
	attack_timer.timeout.connect(generate_projectile)
	attack_timer.wait_time = owner.attack_speed
	print(attack_timer.wait_time)
	attack_timer.start()
	
func _process(delta):
	pass
	#print(attack_timer.time_left)

func generate_projectile():
	print("SM:Attacking:generating projectile")
	var new_bullet = owner.projectile.instantiate()
	projectile_generator.add_child(new_bullet)
	new_bullet.position = projectile_generator.position #TODO añadir posición mínimamente variable
	times_attacked += 1
	if times_attacked > 4: #TODO hacer número de ataques variables
		state_machine.transition_to("Idle") 

func exit() -> void:
	pass
