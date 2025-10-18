extends Resource
class_name Component 

@export var Name : String 

@export_multiline var on_turn_end_desc : String
@export_multiline var on_trigger_desc : String

@export var max_connections : int
@export var sprite : Texture2D

signal triggered()

func on_place() -> void:
    pass
func on_connect(_neighbour : ComponentInstance) -> void:
    pass
func on_appear() -> void:
    pass
func on_item_trigger() -> void:
    pass
func on_turn_end(_neighbour : Array[ComponentInstance],s : ComponentInstance ) -> void:
    pass
func trigger(_neighbour : Array[ComponentInstance],s : ComponentInstance,signal_owner : ComponentInstance) -> void:
    pass
func on_turn_start(s : ComponentInstance) -> void:
    pass
# change compoment on right click
func switch() -> void:
    pass