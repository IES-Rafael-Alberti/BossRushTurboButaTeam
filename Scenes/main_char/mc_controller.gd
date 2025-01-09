extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -600.0

@onready var attack_area = $AttackArea


func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _unhandled_input(event):
	if Input.is_action_just_pressed("attack"):
		var enemies_in_attack_area = attack_area.get_overlapping_bodies()
		if enemies_in_attack_area.size()>0:
			print("attacked")
		else:
			print("failed attack")
