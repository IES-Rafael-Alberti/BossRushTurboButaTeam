extends Boss

@export var safe_distance:float
@export_category("Shooting")
@export var attack_speed:float
#daño y velocidad del proyectil configurable en escena projectile
@export var projectile = preload("res://Scenes/base_enemy/Projectile.tscn")
