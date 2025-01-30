extends Boss

@onready var sprite: AnimatedSprite2D = $LionSprite
#propiedades del boss, exportadas para editarlas en runtime y más cómodamente
@export_category("Lion Abilities")
@export var jump_distance = 1000.0
@export var walk_distance = 500.0
@export var push_strength = 500
# time para el salto
var jumpTime = 0
