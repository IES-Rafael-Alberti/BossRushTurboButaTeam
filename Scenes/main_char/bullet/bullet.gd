extends RigidBody2D

@export var damage = 50
@export var shooting_bonus_dmg = 25
#@export var initial_force: Vector2 = Vector2(300,-1000)
func _ready():
	game_manager.bonus_dmg_on.connect(activate_bonus_damage)
	game_manager.bonus_dmg_off.connect(reset_damage)
	#apply_impulse(initial_force)

func _process(delta):
	pass
	#position.x += 2 #HACK tremendo
func _physics_process(delta):
	pass

func _on_body_entered(body):
	if body.has_method("process_attack"):
		body.process_attack(damage)
		queue_free()

func activate_bonus_damage():
	damage+=shooting_bonus_dmg

func reset_damage():
	damage-=shooting_bonus_dmg
