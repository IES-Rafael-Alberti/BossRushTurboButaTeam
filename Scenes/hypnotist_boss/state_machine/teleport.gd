extends State

#TODO Cambiar var al boss & lo de la función dentro de enter tambien YEY 
@export var min_tp_time = 3.0
@export var max_tp_time = 5.0

var next_tp_time
var time_since_last_tp

func enter(_msg := {}) -> void:
	next_tp_time = randf_range(min_tp_time, max_tp_time)
	
func update(_delta:float) -> void:
	time_since_last_tp += _delta
	if time_since_last_tp >= next_tp_time:
		teleport()
		next_tp_time = randf_range(min_tp_time, max_tp_time)
		time_since_last_tp = 0.0

func teleport():
	owner.global_position = owner.player.global_position.x - 350
	
