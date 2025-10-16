extends Node
class_name GameState

signal state_change(s : State)

var state

func _ready():
    change_state(State.Tutorial)

func change_state(s : State):
    state = s
    state_change.emit(s)

enum State{
    Playing,
    Selecting,
    Tutorial
}