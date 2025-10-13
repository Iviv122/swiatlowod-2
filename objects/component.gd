extends StaticBody2D
class_name ComponentInstance

# replace with resource
# where resource will have function
@export var component : Component 
@export var sprite : Sprite2D

func set_component(comp : Component):
	component = comp 
	sprite.texture = comp.sprite
