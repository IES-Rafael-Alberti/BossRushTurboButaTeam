extends CharacterBody2D


@export_category("Stats")
@export var SPEED = 600.0
@export var JUMP_VELOCITY = -1200.0
@export var health = 500
@export var attack_damage = 100
@export_category("Shooting")
@export var min_shoot_range = Vector2(50,-100)
@export var max_shoot_range = Vector2(1000,-2000)
@export var force_by_frame = Vector2(50,-100)
@export_category("Parry")
@export var frames_for_parry = 60
var awaited_frames = 0
@onready var attack_area = $AttackArea
@onready var shoot_bar: TextureProgressBar = $ShootBar
@onready var state_machine: StateMachine = $StateMachine
@onready var sprite: AnimatedSprite2D = $sprite

var facing = 1 #TODO

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func process_attack(dmg) -> void:
	while awaited_frames<frames_for_parry:
		if Input.is_action_just_pressed("parry"):
			state_machine.transition_to("Attack")
			print("attack_parried") #FIXME print
			awaited_frames=0
			return
		await Engine.get_main_loop().process_frame
		awaited_frames+=1
	awaited_frames=0
	recieve_attack(dmg)
	
func recieve_attack(dmg) -> void:
	print("damage recieved") #FIXME print
	health-=dmg
	print(health)
	if health<=0:
		die()

func die():
	process_mode = PROCESS_MODE_DISABLED
	
