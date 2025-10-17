extends Component
class_name EntryPoint 

var was_triggered = false

func on_turn_start(_s : ComponentInstance) -> void:
	was_triggered = false 

func on_turn_end(_neighbours : Array[ComponentInstance],s : ComponentInstance) -> void:
	trigger(_neighbours,s)
	was_triggered = true

func trigger(_neighbours : Array[ComponentInstance], s :ComponentInstance) -> void:
	if !was_triggered:
		
		was_triggered = true
		PopTextCreatorInstance.pop_text(s.global_position,"triggered",Color.GREEN)
		var i = randi_range(0,_neighbours.size()-1)
		var n  = _neighbours[i] 
		n.trigger()
		s.send_pulse(i)
	else: 
		PopTextCreatorInstance.pop_text(s.global_position,"was used",Color.RED)
