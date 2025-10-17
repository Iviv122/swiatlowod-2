extends Component
class_name ActivateNeighbour 

var was_triggered = false

func on_turn_end(_neighbours : Array[ComponentInstance]) -> void:
    was_triggered = false 
    trigger(_neighbours)

func trigger(_neighbours : Array[ComponentInstance]) -> void:
    if was_triggered:
        return
    var n = _neighbours.pick_random()
    n.trigger()
    was_triggered = true
