extends Node2D

@onready var roll_interval_timer: Timer = $roll_interval_timer
@onready var wheel_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@export var roll_interval:float = 30
@export var spin_duration:float = 3
var stop_at = 0
var stopping_wheel = false
var result = 0

func _ready():
	game_manager.is_boss_lion = true
	#result = randi_range(0,1)
	spin()
	roll_interval_timer.wait_time = roll_interval
	roll_interval_timer.timeout.connect(spin)

func spin():
	result = randi_range(0,3)
	print("new_result")
	animation_player.play("rotation")
	stop_at = (result*45)+randi_range(0,45)
	await get_tree().create_timer(spin_duration).timeout
	animation_player.stop()
	stopping_wheel = true

func _process(delta):
	if stopping_wheel:
		#print("rot:", wheel_sprite.rotation,"stop_at:",stop_at)
		print(delta)
		wheel_sprite.rotation = lerpf(wheel_sprite.rotation,stop_at, 360/60*delta) #TODO transición seamless a cuando está parando
		if roundf(wheel_sprite.rotation)==stop_at:
			print("stopped stopping_wheel")
			stopping_wheel = false
			process_result()

func process_result():
	game_manager.reset_properties()
	match result:
		0:
			print("0:showing_lion")
			game_manager.swap_boss.emit(true)
		1:
			print("1:showing_joker")
			game_manager.swap_boss.emit(false)
		2:
			print("2:Fast mode")
			game_manager.change_game_speed(1.5)
		3:
			print("3:Slow mode")
			game_manager.change_game_speed(0.5)
		4:
			print("4")
		5:
			print("5")
		6:
			print("6")
		7:
			print("7")
		##8:
			##print("8")
