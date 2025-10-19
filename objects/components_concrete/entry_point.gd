extends Component
class_name EntryPoint 

var was_triggered = false

func on_turn_end(_neighbours : Array[ComponentInstance],s : ComponentInstance) -> void:
	was_triggered = false 
	trigger(_neighbours,s,s)

func trigger(_neighbours : Array[ComponentInstance],s : ComponentInstance,signal_owner : ComponentInstance) -> void:
	if !was_triggered:
		if _neighbours.size() >0:	
			was_triggered = true
			var i = randi_range(0,_neighbours.size()-1)
			s.send_pulse(i)
	was_triggered = true
