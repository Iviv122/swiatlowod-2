extends Line2D
class_name Wire

func _ready():
	add_to_group("on_turn_start")

func play_effect(s: ComponentInstance,neighbour : ComponentInstance):
	var pulse_particle = PulseSignal.new()

	pulse_particle.global_position = s.global_position 
	pulse_particle.signal_owner = s

	get_tree().root.add_child(pulse_particle)

	pulse_particle.send(neighbour)	