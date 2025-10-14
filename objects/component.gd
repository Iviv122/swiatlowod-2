extends StaticBody2D
class_name ComponentInstance

# replace with resource
# where resource will have function
@export var component : Component 
@export var sprite : Sprite2D
@export var selection_circle : SelectionCircle 

func _mouse_enter() -> void:
	selection_circle.appear()
func _mouse_exit() -> void:
	selection_circle.disappear()


func set_component(comp : Component):
	component = comp 
	sprite.texture = comp.sprite
	component.on_place()
