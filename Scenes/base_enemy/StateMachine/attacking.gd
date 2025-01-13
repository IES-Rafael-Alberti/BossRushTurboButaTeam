extends State
@onready var projectile_generator = %ProjectileGenerator
@onready var attack_timer = %Attack_Timer

func enter(_msg := {}):
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
	new_bullet.position = projectile_generator.position
