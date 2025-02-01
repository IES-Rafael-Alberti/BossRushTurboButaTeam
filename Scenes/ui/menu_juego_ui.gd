extends Control

var player:Node
@onready var player_health = $PlayerHealth
@onready var shoot_charge = $shootCharge
@onready var hipno_health = $HipnoHealth
@onready var lion_health = $LionHealth
@onready var spriteLion = $Lion
@onready var spriteHipno = $Hipno
@onready var hipno = $Hipno
@onready var lion = $Lion

func _ready():
	game_manager.mc_dmg.connect(playerGetDmg)
	game_manager.joker_dmg.connect(HipnoGetDmg)
	game_manager.lion_dmg.connect(LionGetDmg)
	game_manager.swap_boss.connect(lionHudVisible)
	
func playerGetDmg(getDmg:int):
	player_health.value -= getDmg
	
func HipnoGetDmg(getDmg:int):
	print("entra")
	hipno_health.value -= getDmg

func LionGetDmg(getDmg:int):
	lion_health.value -= getDmg

func lionHudVisible(is_lion:bool):
	if !is_lion:
		spriteHipno.visible = true
		spriteLion.visible = false
		hipno_health.visible = true
		lion_health.visible = false
	else:
		spriteHipno.visible = false
		spriteLion.visible = true
		hipno_health.visible = false
		lion_health.visible = true
