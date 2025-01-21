extends State

#var frames_for_parry = owner.frames_for_parry
#var awaited_frames = 0
#
#func enter(_msg := {}) -> void:
	#awaited_frames = 0
#
#func update(delta) -> void:
	#awaited_frames+=1
