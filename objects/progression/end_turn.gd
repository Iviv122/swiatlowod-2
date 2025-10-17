extends Button 
class_name EndTurn 

func _pressed() -> void:
	print("turn end")
	get_tree().call_group("on_turn_end","on_turn_end")	