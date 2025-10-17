extends Component
class_name EntryPoint 

var was_triggered = false

func on_turn_end(_neighbours : Array[ComponentInstance],s : ComponentInstance) -> void:
	was_triggered = false 
	trigger(_neighbours,s)

func trigger(_neighbours : Array[ComponentInstance], s :ComponentInstance) -> void:
	if !was_triggered:
		
		was_triggered = true
		PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)
		var i = randi_range(0,_neighbours.size()-1)
		s.send_pulse(i)
	else: 
		PopTextCreatorInstance.pop_text(s.global_position,"was used",Color.RED)
	was_triggered = true
