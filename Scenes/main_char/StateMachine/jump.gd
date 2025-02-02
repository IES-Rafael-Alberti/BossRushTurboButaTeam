extends State

@onready var jump: AudioStreamPlayer = $"../../Jump"

func enter(_msg := {}) -> void:
	owner.velocity.y = owner.JUMP_VELOCITY

func update(delta:float) -> void:
	#print('tiempo: ')
	#print(delta)
	state_machine.transition_to("Air")
	jump.play()
	
