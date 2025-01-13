extends State

func enter(_msg := {}) -> void:
	print("entered idle")

func handle_input(_event:InputEvent) -> void:
	pass

func exit() -> void:
	print("exit idle")
