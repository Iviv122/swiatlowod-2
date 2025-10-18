extends Label 
class_name TurnTimer

var time = 0
func _ready() -> void:
	add_to_group("on_turn_end")
	add_to_group("on_turn_start")
	on_turn_start()

func on_turn_start():
	hide()

func on_turn_end():
	show()
	time = GameProgressionInstance.turn_length


func _process(delta: float) -> void:
	time -= delta
	text = str(int(time))
