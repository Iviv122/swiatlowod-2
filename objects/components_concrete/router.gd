extends Component
class_name Router


func send(_neighbours : Array[ComponentInstance], s :ComponentInstance):
	PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)

	s.send_pulse(randi_range(0,_neighbours.size()-1))

func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance,_signal_owner : ComponentInstance) -> void:
	send(_neighbour,s)
