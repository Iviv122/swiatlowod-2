extends Component
class_name Forwarder

var target_dir : int = 0

func switch():
	print("switch")
	if target_dir == 1:
		target_dir = 0
	else:
		target_dir = 1

func send(_neighbours : Array[ComponentInstance], s :ComponentInstance,_signal_owner : ComponentInstance):

	PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)
	if _neighbours[0] && _neighbours[1]:
			s.send_pulse(target_dir)

func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance,signal_owner : ComponentInstance) -> void:
	send(_neighbour,s,signal_owner)