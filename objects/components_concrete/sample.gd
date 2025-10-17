extends Component
class_name Sample

func on_place() -> void:
    print("placed")

func on_connect(_neighbour : ComponentInstance) -> void:
    print("connected")

func on_appear() -> void:
    print("new item appeared")

func on_item_trigger() -> void:
    print("item in grid done something")

func on_turn_end(_neighbours : Array[ComponentInstance]) -> void:
    print("turn ended")

func trigger(_neighbours : Array[ComponentInstance]) -> void:
    print("i was triggered")

