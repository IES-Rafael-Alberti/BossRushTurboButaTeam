class_name Boss
extends CharacterBody2D

@export var health = 500
@export var speed = 300.0
#@export var jump_force = -3000.0
@export var attack_damage = 50
var player: CharacterBody2D
var direction
var is_flipped = false

func _ready():
	search_for_player()

func _physics_process(delta):
	# Añade la gravedad.
	if not is_on_floor():
		velocity += get_gravity() * delta
	 #Imprescindible para que el cuerpo procese físicas.
	move_and_slide()
	#TODO Hay que tener en cuenta la vida del player, porque cuando llega a 0 no reconoce la posición
	direction = (player.global_position - global_position).normalized()
	if !is_flipped:
		if direction.x > 0:
			scale.x *= -1
			is_flipped = true
	else:
		if direction.x < 0:
			scale.x *= -1
			is_flipped = false

func search_for_player():
	player = get_node("%MainChar")

func process_attack(dmg:float):
	if name=="LionBoss":
		game_manager.lion_dmg.emit(dmg)
	else:
		game_manager.joker_dmg.emit(dmg)
	health-=dmg
	print("dmg received, hp: ",health)
	if health<=0:
		queue_free()
