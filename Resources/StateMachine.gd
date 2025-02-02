class_name StateMachine
extends Node

## CÓDIGO DE LA MÁQUINA DE ESTADOS BASE
# Este script lo que hace es gestionar los estados entre sí. La lógica y funcionalidad irá dentro de cada estado.

## Señal que se emite cuando la máquina pasa de un estado a otro
signal transitioned(state_name)

#Estado en el que queremos que la máquina empiece. Normalmente, "Idle"
@export var initial_state := NodePath()
#Estado actual de la máquina. Irá cambiando constantemente. Lo asignamos para que de primera sea initial_state
@onready var state: State = get_node(initial_state)

func _ready() -> void:
	#Esperamos a que todo sobre el nodo padre cargue
	await owner.ready
	#Por cada hijo de la máquina de estado(es decir, cada estado):
	for child in get_children():
		#Dentro de cada hijo (que debe extender la clase "State") asignamos su máquina de estado a esta
		child.state_machine = self
	#Entramos en el estado inicial
	state.enter()
 ## Desde aquí gestionaremos los Inputs (teclas pulsadas etc, sobre todo útil para personajes controlables)
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
#Process pero desde el propio State
func _process(delta: float) -> void:
	state.update(delta)
#Physics_process del state
func _physics_process(delta: float) -> void:
	state.physics_update(delta)

## Transicionador de la máquina entre estados
func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	#print(owner.name, "SM : Transición ",state.name,">",target_state_name) #FIXME print
	#Si el nodo alque queremos transicionar no existe:
	if not has_node(target_state_name):
		#print("no such node as " + target_state_name)
		return
	#Aquí cambiamos state al nuevo estado
	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	#emitimos la señal de transición
	emit_signal("transitioned", state.name)
