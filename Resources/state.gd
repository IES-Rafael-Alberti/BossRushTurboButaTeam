class_name State
extends Node
## Máquina de estado que gestiona este estado (autoasignado por state_machine.gd)
var state_machine: StateMachine = null

## Gestor de inputs del estado
func handle_input(_event:InputEvent) -> void:
	pass

## Update del estado (como _process)
func update(_delta:float) -> void:
	pass

## Physics_update del estado
func physics_update(_delta:float) -> void:
	pass

## Se ejecuta al entrar en el estado (como _ready)
func enter(_msg := {}) -> void:
	pass

## Se ejecuta al salir del estado
func exit() -> void:
	pass
#
#func update_player_position():
	#var raycast_left = owner.get_node("RayCastLeft")
	#var raycast_right = owner.get_node("RayCastRight")
#
	#if raycast_left.is_colliding():
		#player_position = raycast_left.get_collision_point()
	#elif raycast_right.is_colliding():
		#player_position = raycast_right.get_collision_point() 
