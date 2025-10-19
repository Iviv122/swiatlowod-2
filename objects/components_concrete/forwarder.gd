extends Component
class_name Forwarder

var target_dir: int = 0

var ss: ComponentInstance

func switch(_neighbour: Array[ComponentInstance], s: ComponentInstance) -> void:
	if _neighbour.size() == 0:
		return
	if 1 == _neighbour.size():
		target_dir = 0
	else:
		if target_dir == 1:
			target_dir = 0
		else:
			target_dir = 1

	look_at(_neighbour[target_dir].global_position)

func look_at(pos: Vector2):
	ss.rotation_degrees = rad_to_deg((pos - ss.global_position).angle()) + 90

func on_connect(_neighbour: ComponentInstance, s: ComponentInstance) -> void:
	if !ss:
		ss = s
	look_at(_neighbour.global_position)
	if target_dir == 0:
		target_dir = 1

func send(_neighbours: Array[ComponentInstance], s: ComponentInstance, _signal_owner: ComponentInstance):
	if 1 == _neighbours.size():
			s.send_pulse(0)
			PopTextCreatorInstance.pop_text(s.global_position, "forwarded", Color.GREEN)
	elif 1 < _neighbours.size():
			s.send_pulse(target_dir)
			PopTextCreatorInstance.pop_text(s.global_position, "forwarded", Color.GREEN)

func trigger(_neighbour: Array[ComponentInstance], s: ComponentInstance, signal_owner: ComponentInstance) -> void:
	send(_neighbour, s, signal_owner)
