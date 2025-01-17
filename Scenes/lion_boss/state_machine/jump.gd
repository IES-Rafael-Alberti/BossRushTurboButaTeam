extends State

@onready var P0_lion_position
@onready var P2_player_position
@onready var P1_middle 
@onready var time = 0
@export var jump_duration = 1

var is_jumping = false

func enter(_msg := {}) -> void:
	jump()
	print("Jump ON")

func jump():
	P0_lion_position = owner.position
	P2_player_position = owner.player.position
	P1_middle = P0_lion_position - P2_player_position
	P1_middle.y += 100
	
	is_jumping = true
	owner.velocity.y = owner.jump_force
	
func transtions():
	if owner.is_on_floor():
		is_jumping = false
		if owner.global_position.distance_to(owner.player.global_position) < owner.walk_distance:
			state_machine.transition_to("Walk")
		else:
			state_machine.transition_to("Idle")


#func update(_delta:float) -> void:
	#if is_jumping:
		#var direction = (owner.player.global_position - owner.global_position).normalized()
		##owner.global_position.x += owner.speed *sign(direction.x)* _delta
		#owner.global_position.x = owner.player.global_position.x
	#transtions()
	##owner.global_position += direction * walk_speed * _delta

	
func bezier(t):
	var q0 = P0_lion_position.lerp(P1_middle,t)
	var q1 = P1_middle.lerp(P2_player_position,t)
	var r = q0.lerp(q1,t)
	return r
	
func _process(delta: float) -> void:
	if is_jumping:
		owner.position = bezier(time)
		time += delta
		if time >= jump_duration:
			time = 0
			is_jumping = false
		
func exit() -> void:
	print("Jump OFF")
