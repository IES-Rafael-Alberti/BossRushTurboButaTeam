extends Control

var player:Node
@onready var player_health = $PlayerHealth
@onready var shoot_charge = $shootCharge

func _ready():
	GameManager.HealthPlayerBar.connect(UpdateProgressBar)
	player_health.max_value = GameManager.health_player
	player_health.value = GameManager.health_player

func UpdateProgressBar():
	player_health.value = GameManager.health_player
	if player_health.value <= 0:
		print("Colocatelatota")
		
