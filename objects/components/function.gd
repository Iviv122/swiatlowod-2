extends Resource
class_name Component 

@export var Name : String 

@export_multiline var on_turn_end_desc : String
@export_multiline var on_trigger_desc : String

@export var max_connections : int
@export var sprite : Texture2D

signal triggered()

func on_place(s : ComponentInstance) -> void:
	pass
func on_connect(_neighbour : ComponentInstance,s : ComponentInstance) -> void:
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
func switch(_neighbour : Array[ComponentInstance],s : ComponentInstance )-> void:
	pass

func _to_string() -> String:
	var res = ""
	if on_trigger_desc != "":
		res += "On trigger:\n"+ on_trigger_desc + "\n\n"
	if on_turn_end_desc != "":
		res += "On turn end:\n"+ on_turn_end_desc + "\n\n"
	return res
