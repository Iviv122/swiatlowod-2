extends CanvasLayer
class_name SelectCanvas

func _ready():
    GameStateInstance.state_change.connect(state_changed)
    hide()

func state_changed(s : GameState.State):
    if s != GameState.State.Selecting:
        hide()
        return

    show()