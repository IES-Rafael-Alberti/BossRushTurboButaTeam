extends CharacterBody2D
@export_category("Stats")
@export var speed = 100
@export var jump_force = 200
@export var health = 1000
@export var projectile:PackedScene
@export_category("Attacks_Stats")
##Esto será utilizado en Timers, por lo que conviene usar un formato S.MM
@export var attack_speed:float = 1.00
@export var attack_damage:int = 100

@onready var state_machine = $StateMachine

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func process_attack(dmg:float):
	health-=dmg
	if health<0:
		queue_free()
