extends Component
class_name DNS

func on_turn_end(_neighbour : Array[ComponentInstance],s : ComponentInstance ) -> void:
    s.network.trigger_all()