extends CharacterBody2D

@export_category("Stats")
@export var SPEED = 600.0
@export var JUMP_VELOCITY = -1200.0
@export var health = 500
@export var attack_damage = 100 #This is melee dmg. To modify projectile dmg check each projectile node
@export_category("Shooting")
@export var shooting_arrows = true #si false suelta balas
@export var arrow:PackedScene = preload("res://Scenes/main_char/bullet/arrow.tscn")
@export var bullet:PackedScene = preload("res://Scenes/main_char/bullet/bullet.tscn")
#@export var :PackedScene = preload("res://Scenes/main_char/bullet/arrow.tscn")

@export var min_shoot_range = Vector2(50,-100)
@export var max_shoot_range = Vector2(1000,-2000)
@export var force_by_frame = Vector2(50,-100)
@export_category("Parry")
@export var frames_for_parry = 60
@export_category("Roulette Bonuses")
@export var roulette_dmg_bonus = 50 #This is melee dmg. To modify projectile bonus dmg check each projectile node

@onready var attack_area = $AttackArea
@onready var shoot_bar: TextureProgressBar = $ShootBar
@onready var state_machine: StateMachine = $StateMachine

var awaited_frames = 0
var facing:bool = true #true izqader
#DEPTODO #izqader 1(scale +) deraizq -1(scale -) 

func _ready():
	game_manager.bonus_dmg_on.connect(activate_bonus_damage)
	game_manager.bonus_dmg_off.connect(reset_damage)
	game_manager.swap_shooting.connect(swap_bullets)

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
		queue_free()

func activate_bonus_damage():
	attack_damage+= roulette_dmg_bonus

func reset_damage():
	attack_damage-=roulette_dmg_bonus

func swap_bullets(arrows:bool):
	shooting_arrows = arrows
