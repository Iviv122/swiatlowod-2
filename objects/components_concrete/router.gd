extends Component
class_name Router


func send(_neighbours : Array[ComponentInstance], s :ComponentInstance):
	s.send_pulse(randi_range(0,_neighbours.size()-1))

func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance,_signal_owner : ComponentInstance) -> void:
	send(_neighbour,s)
