extends CanvasLayer
class_name LoseCanvas

@export var lose_sound : AudioStream

func appear(s : GameState.State):
    if s != GameState.State.Lost:
        return 
    show()
    AudioPlayerInstance.urgent_play(lose_sound)


func _ready():
    GameStateInstance.state_change.connect(appear)
    hide()