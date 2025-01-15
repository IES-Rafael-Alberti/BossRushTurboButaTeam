extends State
#Referenciamos el área de ataque
@onready var attack_area = %AttackArea

#Las funciones de State están comentadas en state.gd
func enter(_msg := {}) -> void:
	pass

func update(_delta:float) -> void:
	pass

func exit() -> void:
	pass

#Si un cuerpo entra en el área de ataque, le pedimos a la máquina de estados que nos lleve al estado "Attack"
func _on_attack_area_body_entered(body):
	state_machine.transition_to("Attack")
