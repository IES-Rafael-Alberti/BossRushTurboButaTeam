class_name Boss
extends CharacterBody2D

@export var speed = 300.0
@export var jump_force = -3000.0
@export var attack_damage = 50
var player: Node

func _ready():
	search_for_player()

func _physics_process(delta):
	# Añade la gravedad.
	if not is_on_floor():
		velocity += get_gravity() * delta
	 #Imprescindible para que el cuerpo procese físicas.
	move_and_slide()

func search_for_player():
	player = get_node("../MainChar")
