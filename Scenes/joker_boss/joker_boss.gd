extends Boss
@onready var sprite: AnimatedSprite2D = $sprite

@export var safe_distance:float
@export_category("Shooting")
#this var is the time between attacks
@export var attack_speed:float
#daño y velocidad del proyectil configurable en escena projectile
@export var projectile = preload("res://Scenes/base_enemy/Projectile.tscn")
@export_category("Jump")
@export var jump_force:float
@export var jump_distance:float
