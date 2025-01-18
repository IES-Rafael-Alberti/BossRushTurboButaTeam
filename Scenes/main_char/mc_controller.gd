extends CharacterBody2D

@export_category("Stats")
@export var SPEED = 600.0
@export var JUMP_VELOCITY = -1200.0
@export var health = 500
@export var attack_damage = 100
@export var min_shoot_range = Vector2(50,-100)
@export var max_shoot_range = Vector2(1000,-2000)
@export var force_by_frame = Vector2(50,-100)
@onready var attack_area = $AttackArea
@onready var shoot_bar: TextureProgressBar = $ShootBar

var facing = 1 #TODO

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func process_attack(dmg) -> void:
	health-=dmg
	print(health)
	if health<=0:
		queue_free()
