extends Component
class_name Repeater 


func send(_neighbours : Array[ComponentInstance], s :ComponentInstance,_signal_owner : ComponentInstance):
	for i in _neighbours.size():
		if _neighbours[i] == _signal_owner:
			continue
		s.send_pulse(i)

func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance,signal_owner : ComponentInstance) -> void:

	if signal_owner.component is Repeater:
		if randf() > 0.5:
			send(_neighbour,s,signal_owner)
	else:
		send(_neighbour,s,signal_owner)
		
