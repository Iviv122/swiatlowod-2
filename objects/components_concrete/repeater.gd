extends Component
class_name Repeater 

var was_triggered = false

func on_turn_end(_neighbours : Array[ComponentInstance],s : ComponentInstance) -> void:
	was_triggered = false 

func send(_neighbours : Array[ComponentInstance], s :ComponentInstance):
	for i in _neighbours.size():
				PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)
				s.send_pulse(i)

func trigger(_neighbours : Array[ComponentInstance], s :ComponentInstance) -> void:
	if was_triggered:
		if randf() > 0.9:
			send(_neighbours,s)
	else:
		send(_neighbours,s)
	was_triggered = true	
