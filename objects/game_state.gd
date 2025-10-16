extends Node
class_name GameState

signal state_change(s : State)

var state = State.Tutorial

func _ready():
    state_change.emit(State.Tutorial)

func change_state(s : State):
    state = s
    state_change.emit(State.Tutorial)

enum State{
    Playing,
    Selecting,
    Tutorial
}