extends StaticBody2D
class_name ComponentInstance

# replace with resource
# where resource will have function
@export var component: Component
@export var sprite: Sprite2D
@export var selection_circle: SelectionCircle

var text_above: Label

var neighbours: Array[ComponentInstance]

signal updated(c : Component)

func connect_neighbour(neighbour: ComponentInstance) -> void:
	neighbours.append(neighbour)
	updated.emit(self)
	component.on_connect()
	get_tree().call_group("pop_text","pop_text",global_position,"+connected",Color.GREEN)

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

func _ready() -> void:
	text_above = ConnectionLabel.new()

	text_above.setup(self)

	add_child(text_above)

func set_component(comp: Component):
	component = comp
	sprite.texture = comp.sprite
	component.on_place()
