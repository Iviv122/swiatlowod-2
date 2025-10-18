extends Button 
class_name EndTurn 

func _ready():
	add_to_group("on_turn_start")

func on_turn_start():
	show()

func _pressed() -> void:
	print("turn end")
	get_tree().call_group("on_turn_end","on_turn_end")
	hide()	