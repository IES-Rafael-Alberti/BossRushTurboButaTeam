extends Node2D

@onready var lion_boss = $Bosses/LionBoss
@onready var joker_boss = $Bosses/JokerBoss

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_manager.swap_boss.connect(swap_boss)
	#lion_boss.process_mode = PROCESS_MODE_DISABLED 
	joker_boss.process_mode = PROCESS_MODE_DISABLED 
	game_manager.player_died.connect(game_over)
	game_manager.boss_dead.connect(permanent_boss)
func swap_boss(is_lion:bool)-> void : #TODO cuando muera uno que se ponga el otro
	if game_manager.one_boss_dead:
		return
	print("called_swap_boss, is_lion:",is_lion,"is_boss_lion",game_manager.is_boss_lion)
	if is_lion == game_manager.is_boss_lion:
		print("same boss called")
		return
	game_manager.is_boss_lion = !game_manager.is_boss_lion
	lion_boss.visible = game_manager.is_boss_lion
	joker_boss.visible = !game_manager.is_boss_lion
	if game_manager.is_boss_lion:
		lion_boss.process_mode = PROCESS_MODE_INHERIT
		joker_boss.process_mode = PROCESS_MODE_DISABLED
	else:
		joker_boss.process_mode = PROCESS_MODE_INHERIT
		lion_boss.process_mode = PROCESS_MODE_DISABLED

func permanent_boss(def):
	await Engine.get_main_loop().process_frame
	var node = find_child("LionBoss")
	print("-------------------------------------",node)
	if node==null:
		var jb = find_child("JokerBoss")
		if jb!=null:
			jb.show()
			jb.process_mode = PROCESS_MODE_INHERIT
		else:
			return
	else:
		lion_boss.show()
		lion_boss.process_mode = PROCESS_MODE_INHERIT

func game_over():
	get_tree().call_deferred("change_scene_to_file","res://Scenes/game_over.tscn")
	#get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
#func _process(delta: float) -> void:
	#pass
