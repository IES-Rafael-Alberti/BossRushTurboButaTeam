extends CharacterBody2D

@export_category("Stats")
@export var SPEED = 600.0
@export var JUMP_VELOCITY = -600.0
@export var health = 500
@export var attack_damage = 100

@onready var ground = $ground

func _ready():
	ground.text = "hola"
func _process(delta):
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		#if velocity.x<0:
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
#
#func _unhandled_input(event):
	#if Input.is_action_just_pressed("attack"):
		#var enemies_in_attack_area = attack_area.get_overlapping_bodies()
		#if enemies_in_attack_area.size()>0:
			#for enemy in enemies_in_attack_area:
				#if enemy.has_method("process_attack"):
					#enemy.process_attack(attack_damage)
		#else:
			#print("failed attack")

func process_attack(dmg) -> void:
	health-=dmg
	print(health)
	if health<0:
		queue_free()
