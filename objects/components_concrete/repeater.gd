extends Component
class_name Repeater 



func trigger(_neighbours : Array[ComponentInstance], s :ComponentInstance) -> void:
	for i in _neighbours.size():
		PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)
		s.send_pulse(i)
