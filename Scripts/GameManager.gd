extends Node

##region señales de la ruleta
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

var is_boss_lion:bool

func change_game_speed(gamespeed:float):
	Engine.time_scale = gamespeed

func reset_properties():
	Engine.time_scale = 1
	bonus_dmg_off.emit()
	swap_shooting.emit(true)
