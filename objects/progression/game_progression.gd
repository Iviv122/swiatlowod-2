extends Node
class_name GameProgression


var points_label : Points
var end_turn_button : EndTurn 

var turn = 0
var turn_length : float = 5

func _ready():
	add_to_group("on_turn_end")

func on_turn_end():

	await get_tree().create_timer(turn_length).timeout
	get_tree().call_group("on_turn_start","on_turn_start")

	turn+=1

	points_label.set_requirement(turn*10)
	if points_label.points >= points_label.req:
		GameStateInstance.change_state(GameState.State.Selecting)
	else:
		print("Lose")
