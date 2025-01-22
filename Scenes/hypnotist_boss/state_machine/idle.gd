extends State


# Called when the node enters the scene tree for the first time.
func enter(_msg := {}) -> void:
	owner.next_tp_time = randf_range(owner.min_tp_time, owner.max_tp_time)

func update(_delta:float) -> void:
	if owner.time_since_last_tp >= owner.next_tp_time && owner.player.is_on_floor():
		state_machine.transition_to("Teleport")
