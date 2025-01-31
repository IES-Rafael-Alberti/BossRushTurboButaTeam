extends State

#TODO enfocar el salto como el attack, con un cooldown
@onready var P0_lion_position
@onready var P2_player_position
@onready var P1_middle 
@export var jump_duration = 1
var is_jumping = false

func enter(_msg := {}) -> void:
	owner.sprite.play("jump")
	jump()
	owner.timerJump = 0.0

func jump():
	P0_lion_position = owner.position
	P2_player_position = owner.player.position
	if owner.is_flipped:
		P1_middle = P2_player_position - P0_lion_position
	else:
		P1_middle = P0_lion_position - P2_player_position
	P1_middle.y += 100
	
	is_jumping = true
	
func transtions():
	if owner.is_on_floor() or owner.timerJump >= jump_duration:
		is_jumping = false
		state_machine.transition_to("Idle")

func update(_delta:float) -> void:
	if is_jumping:
		owner.position = bezier(owner.jumpTime)
		owner.jumpTime += _delta
		owner.timerJump += _delta
	transtions()
	
func bezier(t): #ORO
	var q0 = P0_lion_position.lerp(P1_middle,t)
	var q1 = P1_middle.lerp(P2_player_position,t)
	var r = q0.lerp(q1,t)
	return r
	
func exit() -> void:
	owner.sprite.play("land")
