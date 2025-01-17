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
