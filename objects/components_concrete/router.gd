extends Component
class_name Router


func send(_neighbours : Array[ComponentInstance], s :ComponentInstance):
	PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)
	s.send_pulse(randi_range(0,_neighbours.size()-1))

func trigger(_neighbours : Array[ComponentInstance], s :ComponentInstance) -> void:
	send(_neighbours,s)
