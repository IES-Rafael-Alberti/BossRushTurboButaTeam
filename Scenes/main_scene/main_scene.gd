extends Node2D

@onready var lion_boss = $Bosses/LionBoss
@onready var joker_boss = $Bosses/JokerBoss

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_manager.swap_boss.connect(swap_boss)
	#lion_boss.process_mode = PROCESS_MODE_DISABLED 
	joker_boss.process_mode = PROCESS_MODE_DISABLED 
	
func swap_boss(is_lion:bool)-> void :
	print("called_swap_boss, is_lion:",is_lion,"is_boss_lion",game_manager.is_boss_lion)
	if is_lion == game_manager.is_boss_lion:
		print("same boss called")
		return
	game_manager.is_boss_lion = !game_manager.is_boss_lion
	lion_boss.visible = game_manager.is_boss_lion
	joker_boss.visible = !game_manager.is_boss_lion
	if game_manager.is_boss_lion:
		lion_boss.process_mode = PROCESS_MODE_ALWAYS
		joker_boss.process_mode = PROCESS_MODE_DISABLED
	else:
		joker_boss.process_mode = PROCESS_MODE_ALWAYS
		lion_boss.process_mode = PROCESS_MODE_DISABLED
#func _process(delta: float) -> void:
	#pass
