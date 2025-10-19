extends Component
class_name Accamulator 

var was_triggered = false

func on_turn_start(_s : ComponentInstance) -> void:
	was_triggered = false

func on_turn_end(_neighbour : Array[ComponentInstance],s : ComponentInstance ) -> void:
	if !was_triggered:
		if _neighbour.size() > 0:
			for i in s.network.size:
				s.send_pulse(0)
				was_triggered = true