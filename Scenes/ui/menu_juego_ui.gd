extends Control

var player:Node
@onready var barra_vida_player = $TextureProgressBar

func _ready():
	GameManager.HealthPlayerBar.connect(UpdateProgressBar)
	barra_vida_player.max_value = GameManager.health_player
	barra_vida_player.value = GameManager.health_player

func UpdateProgressBar():
	barra_vida_player.value = GameManager.health_player
	if barra_vida_player.value <= 0:
		print("Colocatelatota")
		
