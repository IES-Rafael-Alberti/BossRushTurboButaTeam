extends Node2D

@onready var wheel_sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@export var spin_duration:int = 3
var stop_at = 0
var stopping_wheel = false
var result = 0
func _ready():
	result = randi_range(0,8)
	spin()

func spin():
	animation_player.play("rotation")
	stop_at = (result*45)+randi_range(0,45)
	await get_tree().create_timer(spin_duration).timeout
	animation_player.stop()
	stopping_wheel = true

func _process(delta):
	if stopping_wheel:
		print("rot:", wheel_sprite.rotation,"stop_at:",stop_at)
		print(delta)
		wheel_sprite.rotation = lerpf(wheel_sprite.rotation,stop_at, 360/60*delta) #TODO transición seamless a cuando está parando
		if roundf(wheel_sprite.rotation)==stop_at:
			print("stopped stopping_wheel")
			stopping_wheel = false
			process_result()

func process_result():
	match result:
		0:
			print("0")
		1:
			print("1")
		2:
			print("2")
		3:
			print("3")
		4:
			print("4")
		5:
			print("5")
		6:
			print("6")
		7:
			print("7")
		8:
			print("8")
