extends Node

#region señales de la ruleta
signal reset_roulette_effects
signal swap_boss(is_lion:bool)
signal tomatoes_on
signal tomatoes_off
signal fast_mode_on
signal fast_mode_off
signal slow_mode_on
signal slow_mode_off
signal swap_shooting(arrow:bool)
signal bonus_dmg_on
signal bonus_dmg_off
#endregion
#region señales recibir daño
signal lion_dmg(dmg:int)
signal joker_dmg(dmg:int)
signal mc_dmg(dmg:int)
#endregion
signal player_died

signal boss_dead(is_lion:bool)
var one_boss_dead = false
var is_boss_lion:bool
@export var tomato_falling_speed = 3
@export var tomato_damage = 20
func change_game_speed(gamespeed:float):
	Engine.time_scale = gamespeed

func reset_properties():
	Engine.time_scale = 1
	bonus_dmg_off.emit()
	swap_shooting.emit(true)
	tomatoes_off.emit()

func _ready():
	boss_dead.connect(win_condition)
func win_condition(def):
	print("=======================trying win", one_boss_dead)
	if one_boss_dead==false:
		one_boss_dead=true
	else:
		get_tree().change_scene_to_file("res://Scenes/credits.tscn") #TODO cambiar a pantalla de victoria
	
