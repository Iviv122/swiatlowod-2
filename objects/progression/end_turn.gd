extends Button 
class_name EndTurn 

func _pressed() -> void:
	get_tree().call_group("on_turn_end","on_turn_end")	