extends State

@onready var joker_col:CollisionShape2D = %JokerCol

func handle_input(_event:InputEvent) -> void:
	pass

func update(_delta:float) -> void:
	if not owner.is_on_floor():
		state_machine.transition_to("Air")
	owner.global_position.x -= (owner.direction * owner.speed * _delta).x
	if owner.global_position.distance_to(owner.player.global_position) > owner.safe_distance:
		state_machine.transition_to("Attack")
	elif owner.is_on_wall():
		state_machine.transition_to("Jump")
func physics_update(_delta:float) -> void:
	pass

func enter(_msg := {}) -> void:
	owner.velocity = Vector2(0,0)
	owner.sprite.play("walking")

func exit() -> void:
	pass
