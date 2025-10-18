extends Component
class_name Repeater 


func send(_neighbours : Array[ComponentInstance], s :ComponentInstance,_signal_owner : ComponentInstance):
	for i in _neighbours.size():
		if _neighbours[i] == _signal_owner:
			continue

		PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)
		s.send_pulse(i)

func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance,signal_owner : ComponentInstance) -> void:
	send(_neighbour,s,signal_owner)
		
