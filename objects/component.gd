extends StaticBody2D
class_name ComponentInstance

# replace with resource
# where resource will have function
@export var component: Component
@export var sprite: Sprite2D
@export var selection_circle: SelectionCircle

var neighbours: Array[ComponentInstance]

func connect_neighbour(neighbour: ComponentInstance) -> void:
	neighbours.append(neighbour)
	component.on_connect()

func _mouse_enter() -> void:
	selection_circle.appear()

func _mouse_exit() -> void:
	selection_circle.disappear()

func give_max_space_error() -> void:
	pass

func have_space() -> bool:
	return neighbours.size() != component.max_connections

func has_neighbour(a: ComponentInstance) -> bool:
	return neighbours.has(a)

func set_component(comp: Component):
	component = comp
	sprite.texture = comp.sprite
	component.on_place()
