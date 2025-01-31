extends State
@onready var projectile_generator = %ProjectileGenerator
@onready var attack_timer = %Attack_Timer
var times_attacked = 0

func _ready() -> void:
	attack_timer.timeout.connect(generate_projectile)

func enter(_msg := {}):
	owner.sprite.play("ataque")
	times_attacked = 0
	attack_timer.wait_time = owner.attack_speed
	#print(attack_timer.wait_time) #FIXME print
	attack_timer.start()
	
func update(_delta):
	if owner.global_position.distance_to(owner.player.global_position) < owner.safe_distance:
		state_machine.transition_to("Walk")
	
func generate_projectile():
	#print("SM:Attacking:generating projectile") #FIXME print
	var new_bullet = owner.projectile.instantiate()
	projectile_generator.add_child(new_bullet)
	new_bullet.position = projectile_generator.position #TODO añadir posición mínimamente variable
	times_attacked += 1
	if times_attacked > 4: #TODO hacer número de ataques variables
		state_machine.transition_to("Idle") 

func exit() -> void:
	pass
