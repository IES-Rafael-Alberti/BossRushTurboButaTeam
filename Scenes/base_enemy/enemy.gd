extends CharacterBody2D
@export_category("Stats")
@export var speed = 100
@export var jump_force = 200
@export var health = 1000

@onready var state_machine = $StateMachine

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func process_attack(dmg:float):
	health-=dmg
	if health<0:
		queue_free()
