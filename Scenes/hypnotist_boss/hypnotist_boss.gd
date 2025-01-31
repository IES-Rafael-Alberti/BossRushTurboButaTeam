extends Boss

#propiedades del boss, exportadas para editarlas en runtime y más cómodamente
@export_category("hypnotist Abilities")
#@export var walk_distance = 500.0
#@export var push_strength = 500
@export var min_tp_time = 3.0
@export var max_tp_time = 5.0
var next_tp_time
var time_since_last_tp = 0
@onready var attack_area = %AttackArea


func _process(delta):
	time_since_last_tp += delta
