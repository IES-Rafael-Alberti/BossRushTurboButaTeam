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
func _process(delta):
	shoot_bar.value += shoot_bar.step

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
		##if velocity.x<0:
			#
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _unhandled_input(event):
	if Input.is_action_just_pressed("attack"):
		var enemies_in_attack_area = attack_area.get_overlapping_bodies()
		if enemies_in_attack_area.size()>0:
			for enemy in enemies_in_attack_area:
				if enemy.has_method("process_attack"):
					enemy.process_attack(attack_damage)
		else:
			print("failed attack")

func process_attack(dmg) -> void:
	health-=dmg
	print(health)
	if health<=0:
		queue_free()
