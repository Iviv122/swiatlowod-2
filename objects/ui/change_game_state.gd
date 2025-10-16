extends Button
class_name ChangeGameState

@export var state_set : GameState.State
@export var remove : Array[Node] 

func _pressed() -> void:
	GameStateInstance.change_state(state_set)
	for i in remove:
		i.queue_free()
