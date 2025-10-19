extends Node
class_name GameProgression


var points_label : Points
var end_turn_button : EndTurn 

var turn = 0
var turn_length : float = 5

signal lost(turns : int)

func _ready():
	add_to_group("on_turn_end")
	GameStateInstance.state_change.connect(reload)

func reload(s : GameState.State) -> void:
	if GameState.State.Tutorial == s: 
		points_label.set_requirement(1)
		turn = 0

func on_turn_end():

	await get_tree().create_timer(turn_length).timeout
	get_tree().call_group("on_turn_start","on_turn_start")

	await get_tree().process_frame

	if points_label.points >= points_label.req:
		GameStateInstance.change_state(GameState.State.Selecting)
		turn+=1
		points_label.set_requirement((turn*10)*(1+turn*0.1))
	else:
		GameStateInstance.change_state(GameState.State.Lost)
		lost.emit(turn)

	
