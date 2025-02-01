extends Control

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var texture_progress_bar2: TextureProgressBar = $TextureProgressBar2
@onready var texture_progress_bar_3: TextureProgressBar = $TextureProgressBar3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	texture_progress_bar.value -= 1
	texture_progress_bar2.value -= 1
	texture_progress_bar_3.value += 1
