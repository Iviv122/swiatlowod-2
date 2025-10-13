extends Sprite2D 
class_name Mouse 

var last_function_selecter : FunctionSelect 
var current_component : Component

var component_prefab : PackedScene

func set_component(comp : Component):
    current_component = comp 
    texture = comp.sprite


func move_sprite(pos : Vector2):
    global_position = pos

func _unhandled_input(event: InputEvent) -> void:

    if event is InputEventMouseMotion:
        move_sprite(event.global_position)
    if event.is_action_pressed("place"):
        print("i am trying to place:" , event.global_position)